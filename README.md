# LASTools_Installer_Updater

A simple script for installing and updating [LASTools](https://rapidlasso.com/).

The script needs an elevated rights powershell (admin) and can be excuted with the following command:

`powershell -executionpolicy bypass -File .\lastools_install_simple.ps1`

The script downloads(to MyDocuments) the latest version from rapidlassos website, extracts it to C:\LASTools.

Then it creates a link on the user Desktop to LASTools\bin.

At last it checks the PATH var and if not presents adds "C:\LASTools\bin".

### Stuff to adjust
change the lastools license file path:
`lastoolslicense = "\\path\2\lastoolslicense.txt"`

if you want to install lastools to a different folder change:
`$lastoolsPathLocal = "c:\"`
The downloaded zip contains the folder LASTools so no need to set it!

if changed, you need to change the following variables according to your install folder:
`$lastoolsfolder ="C:\LASTools"`
`# lastools path as regex`
`$regex = "[cC]\:\\LASTools"`


