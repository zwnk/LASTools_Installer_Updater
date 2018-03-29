# LASTools_Installer_Updater

A simple script for installing and updating [LASTools](https://rapidlasso.com/).

The script needs an elevated rights powershell (admin) and can be excuted with the following command:

`powershell -executionpolicy bypass -File .\lastools_install_simple.ps1`

The script downloads(to MyDocuments) the latest version from rapidlassos website, extracts it to C:\LASTools.

Then it creates a link on the user Desktop to LASTools\bin.

At last it checks the PATH var and if not presents adds "C:\LASTools\bin".

