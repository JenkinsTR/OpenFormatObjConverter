@echo off

rem ******************  MAIN CODE SECTION
set STARTTIME=%TIME%

REM # UNIQUE TIME MACRO
SET "mm=%DATE:~4,2%"
SET "dd=%DATE:~7,2%"
SET "yy=%DATE:~10,4%"
FOR /f "tokens=1-4 delims=:. " %%A IN ("%time: =0%") DO @SET UNIQUE=%yy%-%dd%-%mm%-%%A%%B-%%C%%D

REM Get the directory of the batch file
SET "SCRIPT_DIR=%~dp0"
SET "SCRIPT_PATH=K:\GitHub\OpenFormatObjConverter"
SET "LOG=%SCRIPT_PATH%\OpenFormatObjConverter_%UNIQUE%.log"

REM Initialize start time
set start_date=%DATE%
set start_time=%TIME%

ECHO ------------------------
ECHO OpenFormatObjConverter by svenar-nl
ECHO edited by JMDigital
ECHO ------------------------
ECHO Starting conversion at %start_date% -%start_time%
ECHO.

ECHO ------------------------ > "%LOG%"
ECHO OpenFormatObjConverter by svenar-nl >> "%LOG%"
ECHO edited by JMDigital >> "%LOG%"
ECHO ------------------------ >> "%LOG%"
ECHO Starting conversion at %start_date% -%start_time% >> "%LOG%"
ECHO. >> "%LOG%"
REM Loop through all .odd files in the current directory and its subdirectories
FOR /R "%SCRIPT_DIR%" %%F IN (*.odd) DO (
  REM Call the Python script for each .odd file
  ECHO Processing "%%F"
  python "%SCRIPT_PATH%\OpenFormatObjConverter.py" "%%F" >> "%LOG%"
  ECHO Done!
  ECHO.
  ECHO. >> "%LOG%"
)
REM Loop through all .odr files in the current directory and its subdirectories
FOR /R "%SCRIPT_DIR%" %%G IN (*.odr) DO (
  REM Call the Python script for each .odr file
  ECHO Processing "%%G"
  python "%SCRIPT_PATH%\OpenFormatObjConverter.py" "%%G" >> "%LOG%"
  ECHO Done!
  ECHO.
  ECHO. >> "%LOG%"
)

set ENDTIME=%TIME%

rem ******************  END MAIN CODE SECTION

rem Change fraction part for non-English localizations
set STARTTIME=%STARTTIME:,=.%
set ENDTIME=%ENDTIME:,=.%

rem Change formatting for the start and end times
for /F "tokens=1-4 delims=:.," %%a in ("%STARTTIME%") do (
   set /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

for /F "tokens=1-4 delims=:.," %%a in ("%ENDTIME%") do ( 
   IF %ENDTIME% GTR %STARTTIME% set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100" 
   IF %ENDTIME% LSS %STARTTIME% set /A "end=((((%%a+24)*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100" 
)

rem Calculate the elapsed time by subtracting values
set /A elapsed=end-start

rem Format the results for output
set /A hh=elapsed/(60*60*100), rest=elapsed%%(60*60*100), mm=rest/(60*100), rest%%=60*100, ss=rest/100, cc=rest%%100
if %hh% lss 10 set hh=0%hh%
if %mm% lss 10 set mm=0%mm%
if %ss% lss 10 set ss=0%ss%
if %cc% lss 10 set cc=0%cc%

set DURATION=%hh%:%mm%:%ss%,%cc%

echo ------------------------
echo Start    : %STARTTIME%
echo Finish   : %ENDTIME%
echo ------------------------
echo Duration : %DURATION% 

echo ------------------------ >> "%LOG%"
echo Start    : %STARTTIME% >> "%LOG%"
echo Finish   : %ENDTIME% >> "%LOG%"
echo ------------------------ >> "%LOG%"
echo Duration : %DURATION%  >> "%LOG%"

PAUSE
EXIT
