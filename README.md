# OpenFormatObjConverter
This fork adds support for .ODD (Drawable Dictionary) and .ODR (Drawable Object) LOD style multi-group models. It allows you to convert OpenIV (GTA 4 & GTA 5) .odr and .odd files to Wavefront OBJ files.

## New Features and Improvements

1. **Support for .ODD and .ODR Files:** The script has been extended to handle both .ODD (Drawable Dictionary) and .ODR (Drawable Object) files. Previously, only .ODR files were supported.

2. **Shared Parsing Logic:** The parsing logic for both .ODD and .ODR files has been refactored to use shared functions where possible. The functions `split_odd_file_into_drawables` and `process_odr_data` have been introduced to handle the specific data extraction for each file type.

3. **Efficient File Processing:** The script now processes both .ODD and .ODR files more efficiently by extracting relevant data in a structured manner. It handles shading groups, skeletons, and LOD groups correctly for both file types.

4. **Output File Naming:** The output file names for .ODR files obviously won't include `drawable_name`, as .ODR files don't contain this information. For .ODD files, the output file names will include the `drawable_name`.

5. **Additional Information in README:** The README has been updated to include more detailed information about the improvements and supported formats. Requirements, tested versions, and usage instructions have also been clarified.

## Requirements

- OpenIV
- Python 3

## Tested with

- OpenIV 4.0.1
- Python 3.9.5
- ODR version 110 12 (GTA 4)
- ODR version 165 32 (GTA 5)
- ODD version 110 12 (GTA 4)

## Usage

This script requires 1 argument, the path to the Open Format file. For each LOD (level of detail) model in the .odr or .odd file, it generates a .obj and .mtl file.

```bash
python OpenFormatObjConverter.py <file.odr> OR <file.odd>
```

An example .bat file has been included that will process all .odr and .odd files in all subfolders of the directory specified in the `%SCRIPT_DIR%` variable.

Adjust the following lines to suit your needs:

```bat
SET "SCRIPT_DIR=%~dp0"
SET "SCRIPT_PATH=K:\GitHub\OpenFormatObjConverter"
```

Although it is best that you only update the SCRIPT_PATH variable to the folder where you saved `OpenFormatObjConverter.py`, so that the batch can be copied and launched from the folder/s that contain the ODR/ODD files you want to process.

## Preview
--------------
![](https://raw.githubusercontent.com/svenar-nl/OpenFormatObjConverter/master/images/preview.png)

## Acknowledgments
The initial version of this script was based on the code provided by svenar-nl. Improvements and additional features were added to support .ODD files and enhance the existing functionality for .ODR files.