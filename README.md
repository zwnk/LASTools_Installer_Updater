# LAStools_Installer_Updater

A simple script for installing and updating [LAStools](https://rapidlasso.com/).

The script needs an elevated rights powershell (admin) and can be excuted with the following command:

`powershell -executionpolicy bypass -File .\LAStools_install_simple.ps1`

The script downloads(to MyDocuments) the latest version from rapidlassos website, extracts it to C:\LAStools.

Then it creates a link on the user Desktop to LAStools\bin.

At last it checks the PATH var and if not presents adds "C:\LAStools\bin".

### Stuff to adjust
change the LAStools license file path:

`LAStoolslicense = "\\path\2\yourlicensefile.xxx["`

if you want to install LAStools to a different folder change:

`$LAStoolsPathLocal = "c:\"`

The downloaded zip contains the folder LAStools so no need to set it!

if changed, you need to change the following variables according to your install folder:

`$LAStoolsfolder ="C:\LAStools"`

`# LAStools path as regex`

`$regex = "[cC]\:\\LAStools"`


