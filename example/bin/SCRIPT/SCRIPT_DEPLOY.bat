@echo off 
echo ------------------ CREATING Windows INSTALLER ------------------
echo This script must be placed in:
echo YOUR-OF-APP\bin\OF_Windows_Installer
echo - 
echo for an OpenFrameworks compiled binary app
echo - 
echo 1. Setting Icon for the app.exe using rcedit: https://github.com/electron/rcedit
resources\rcedit-x64 "..\guiExample.exe" --set-icon ..\guiExample.ico"
echo -
echo 2. Build the Setup.exe: Using NSIS: Nullsoft Scriptable Install System: https://sourceforge.net/projects/nsis/
"c:\Program Files (x86)\NSIS\makensis.exe" SCRIPT_OF_APP.nsi