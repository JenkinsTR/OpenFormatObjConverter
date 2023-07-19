# OpenFormatObjConverter
This fork adds support for .ODD (Drawable Dictionary) LOD style multi-group models.

Convert OpenIV (GTA 4 & GTA 5) .odr AND .odd files to Wavefront OBJ files.

Currently this is a quite crude implementation that works.

Requirements
--------------
- OpenIV
- Python 3

Tested with
--------------
- OpenIV 4.0.1
- Python 3.9.5
- ODR version 110 12 (GTA 4)
- ODR version 165 32 (GTA 5)
- ODD version 110 12 (GTA 4)

Usage
--------------
This script requires 1 argument, the path to the Open Format file.
For each LOD (level of detail) model in the odr file it generates a .obj and .mtl file

    OpenFormatObjConverter.py <file.odr> OR <file.odd>

Preview
--------------
![](https://raw.githubusercontent.com/svenar-nl/OpenFormatObjConverter/master/images/preview.png)
