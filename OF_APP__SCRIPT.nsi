; NSIS Script 
; make your own MS Windows installer for your compiled OpenFrameworks App.
; https://github.com/moebiussurfing/OF_Windows_Installer
;
; This script is based into NsiWindowsInstallerExamples-master
;
; help:
; https://nsis.sourceforge.io/Docs/Modern%20UI%202/Readme.html


; more important step is to replace 'Paletto' with your app name
;
; CUSTOMIZE: 
; Define the name of the product.
; In this case it's the same name for the produt title than the .exe file:
; /bin/Paletto.exe is my copied and renamed file after the binary compilation.
!define PRODUCT "Paletto"


;--------------------------------
;Include Modern UI
!include "MUI2.nsh"

;extra plugins
!include "WinMessages.nsh"

;!define MUI_WELCOMEPAGE_TEXT moebiusSurfing

;!define MUI_INSTFILESPAGE_COLORS "00FF00 000000" ;custom console colors
;!define MUI_LICENSEPAGE_BGCOLOR  "00FF00" ;custom license colors

;----

; finish window

; disable autoclose to all read final log
!define MUI_FINISHPAGE_NOAUTOCLOSE

; run the installed program at finish
!define MUI_FINISHPAGE_RUN ${PRODUCT}.exe
;!define MUI_FINISHPAGE_RUN Paletto.exe
;!define MUI_FINISHPAGE_RUN_TEXT enjoy!

; for printing on last window of installation process:

!define MUI_FINISHPAGE_SHOWREADME README.md
;!define MUI_FINISHPAGE_SHOWREADME_TEXT text

; CUSTOMIZE: set your account links
!define MUI_FINISHPAGE_LINK Twitter:@moebiussurfing
;Text for a link on the which the user can click to view a website or file.
!define MUI_FINISHPAGE_LINK_LOCATION https://twitter.com/moebiussurfing
;Website or file which the user can select to view using the link. You don't need to put quotes around the filename when it contains spaces.
;!define MUI_FINISHPAGE_LINK_COLOR "00FF00" ;custom license colors

; free some space. we don't need it bc reboot is not offered to the user and finish
!define MUI_FINISHPAGE_NOREBOOTSUPPORT

;--------------------------------
; General

; Properly display all languages
Unicode true

; Define optional URL that will be opened after the installation was successful
# here we link to visual studio c++ redistributable required for OF apps
!define AFTER_INSTALLATION_URL "https://support.microsoft.com/en-us/topic/the-latest-supported-visual-c-downloads-2647da03-1eea-4433-9aff-95f26a218cc0"
;!define AFTER_INSTALLATION_URL "https://github.com/moebiussurfing/ofxColorManager"
;!define AFTER_INSTALLATION_URL "https://moebiussurfing.itch.io/paletto"

; Define the main name of the installer
Name "${PRODUCT}"

; Define the directory where the installer should be saved and the setup filename 
;OutFile "output\${PRODUCT}_Setup.exe"
OutFile "${PRODUCT}_Setup.exe" # here is on the root path, next to this .nsi script file.

; Define the default installation folder (Windows ProgramFiles example)
;NOTE: i don't know why it selects by default the Program Files (x86) folder.. not the x64 Program Files
; more info here: https://stackoverflow.com/questions/9087538/is-programfiles-a-constant-declared-in-nsis-or-is-it-the-environment-variable-r/44380394#44380394
InstallDir "$PROGRAMFILES\${PRODUCT}"

; Define an optional directory for program files that change (Windows AppData example)
;!define INSTDIR_DATA "$PROGRAMFILES\${PRODUCT}\\data\"

; Request rights if you want to install the program to program files
RequestExecutionLevel admin

; Show 'console' in installer and uninstaller
ShowInstDetails "show"
ShowUninstDetails "show"

; Get installation folder from registry if available
InstallDirRegKey HKLM "Software\${PRODUCT}" ""


;--------------------------------
; Interface Settings

; Show warning if user wants to abort
!define MUI_ABORTWARNING

; Show all languages, despite user's codepage
;!define MUI_LANGDLL_ALLLANGUAGES

; CUSTOMIZE: create your squared png icon and convert to ico using a convertor like ie: 
; https://icoconvert.com/

; Use optional a custom icon:
!define MUI_ICON "resources\example_icon_installer.ico" # for the Installer
!define MUI_UNICON "resources\example_icon_uninstaller.ico" # for the later created UnInstaller

; CUSTOMIZE: update these files in your photo editor if you like.
; notice that must bmp format, not jpg or png are supported.

; Use optional a custom picture for the 'Welcome' and 'Finish' page:
!define MUI_HEADERIMAGE_RIGHT
!define MUI_WELCOMEFINISHPAGE_BITMAP "resources\example_picture_installer.bmp"  # for the Installer
!define MUI_UNWELCOMEFINISHPAGE_BITMAP "resources\example_picture_uninstaller.bmp"  # for the later created UnInstaller

;Optional no descripton for all components
;!define MUI_COMPONENTSPAGE_NODESC


;--------------------------------
;Pages

Function .onInit

;--------------------------------
;0. BgImage
; TODO: seems not working on Modern UI
; ; Function .onGUIInit
;   BgImage::SetBg /GRADIENT 0 0x80 0 0x80 0 0
;   BgImage::SetBg /GRADIENT 0 0x80 0 0x80 0 0
;   BgImage::AddText "Testing 1... 2... 3..." $R0 255 0 0 50 50 800 200
;   BgImage::Redraw
; ; FunctionEnd

;--------------------------------
;1. Banner
; Banner::show "Paletto v1.0"
Banner::show "${PRODUCT} v1.0"
; CUSTOMIZE: you can tweak the intro banners with your app version or whatever..

Banner::getWindow
Pop $1

again:
  IntOp $0 $0 + 1
  Sleep 0.2
  StrCmp $0 100 0 again

GetDlgItem $2 $1 1030

; CUSTOMIZE: you can tweak the intro banners with your app version or whatever..
SendMessage $2 ${WM_SETTEXT} 0 "STR:moebiusSurfing 2021"

again2:
  IntOp $0 $0 + 1
  Sleep 0.2
  StrCmp $0 200 0 again2

Banner::destroy

;--------------------------------
;2. Splash Screen

# the plugins dir is automatically deleted when the installer exits
InitPluginsDir

File /oname=$PLUGINSDIR\splash0.bmp "resources\media\img0.bmp"
File /oname=$PLUGINSDIR\splash1.bmp "resources\media\img1.bmp"
File /oname=$PLUGINSDIR\splash2.bmp "resources\media\img2.bmp"
; File /oname=$PLUGINSDIR\splash0.wav "resources\media\s2.wav" #optional with the same name than first bmp file

; splash::show 2000 $PLUGINSDIR\splash1

;advsplash::show Delay FadeIn FadeOut KeyColor FileName
advsplash::show 2000 200 200 -1 $PLUGINSDIR\splash0
advsplash::show 1000 200 200 -1 $PLUGINSDIR\splash1
advsplash::show 1000 200 200 -1 $PLUGINSDIR\splash2

Pop $0 ; $0 has '1' if the user closed the splash screen early,
; '0' if everything closed normally, and '-1' if some error occurred.

FunctionEnd


;--------------------------------

;For the installer
!insertmacro MUI_PAGE_WELCOME # simply remove this and other pages if you don't want it
!insertmacro MUI_PAGE_LICENSE "resources\LICENSE" # link to an ANSI encoded license file
!insertmacro MUI_PAGE_COMPONENTS # remove if you don't want to list components to choice
!insertmacro MUI_PAGE_DIRECTORY # ask path and confirmation

;TODO: to allow this customization we must get the path from the user
;look /misc/scripts/StartMenu.nsi example
;Var StartMenuFolder # allow customize shortcut
;!insertmacro MUI_PAGE_STARTMENU "Application" $StartMenuFolder

!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH


;For the uninstaller
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH


;--------------------------------
;Languages

;At start will be searched if the current system language is in this list,
;if not the first language in this list will be chosen as language
!insertmacro MUI_LANGUAGE "English"
; !insertmacro MUI_LANGUAGE "French"
; !insertmacro MUI_LANGUAGE "German"
; !insertmacro MUI_LANGUAGE "Spanish"


;--------------------------------
;Installer Section

Section "Main App" SecMain
SectionIn RO # Just means if in component mode this is locked

;Set output path to the installation directory.
SetOutPath $INSTDIR

;OpenFrameworks
;Put the following file in the SetOutPath
;File "..\Paletto.exe" # set your app exe name here!
File "..\${PRODUCT}.exe" # set your app exe name here! (Notice that in this case I use the same name for the product and for the exe file)
File "..\*.dll" # usually all the OF's required dll's
;
;Optional:
File "..\*.ini" # my ImGui.ini files out of bin/data. (they are on /bin)
File "..\..\..\README.md" # my readme

;OpenFrameworks /data/ files 
;default location. close to the exe! 
SetOutPath "$INSTDIR\\data" # that's the typical OF scenario!
File /r "..\data\*.*" # recursive access to all the folders and files! 

;Store installation folder in registry
WriteRegStr HKLM "Software\${PRODUCT}" "" $INSTDIR

;Registry information for add/remove programs
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "DisplayName" "${PRODUCT}"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "UninstallString" '"$INSTDIR\${PRODUCT}_uninstall.exe"'
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "NoModify" 1
WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "NoRepair" 1

;Create optional start menu shortcut for uninstaller and Main component
CreateDirectory "$SMPROGRAMS\${PRODUCT}"
CreateShortCut "$SMPROGRAMS\${PRODUCT}\Uninstall ${PRODUCT}.lnk" "$INSTDIR\${PRODUCT}_Uninstaller.exe" "" "$INSTDIR\${PRODUCT}_Uninstaller.exe" 0

;main shorcut
CreateShortCut "$SMPROGRAMS\${PRODUCT}\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT}.exe" "" "$INSTDIR\${PRODUCT}.exe" 0
; CreateShortCut "$SMPROGRAMS\${PRODUCT}\Paletto.lnk" "$INSTDIR\Paletto.exe" "" "$INSTDIR\Paletto.exe" 0

;README
CreateShortCut "$SMPROGRAMS\${PRODUCT}\README.lnk" "$INSTDIR\README.md" "" "$INSTDIR\README.md" 0

;Create uninstaller
WriteUninstaller "${PRODUCT}_Uninstaller.exe"

SectionEnd

;----

#optional
;uncomment all the SecTwo sections and define the files to copy
;Section "Extra color palettes files" SecTwo
; Save something else optional to the installation directory.
;SetOutPath $INSTDIR
# TODO: add another presets folder
;File "resources\example_file_component_01.txt" 
;Create optional start menu shortcut for other component
;CreateShortCut "$SMPROGRAMS\${PRODUCT}\Other Component.lnk" "$INSTDIR\example_file_component_01.txt" "" "$INSTDIR\example_file_component_01.txt" 0
;SectionEnd

; Section "Third component (optional - if no remove this entry)"
;   ; Save files/a file to the Windows AppData folder
;   SetOutPath ${INSTDIR_DATA}
;   File "resources\example_file_component_02.txt"
; SectionEnd


;--------------------------------
;Descriptions

;Language strings
;CUSTOMIZE: set your descriptions here:
LangString DESC_SecMain ${LANG_ENGLISH} "Main Program and Data files. Adds a user kit with many color palette Presets."
;LangString DESC_SecTwo ${LANG_ENGLISH} "Extra Kit with EXTRA color palette Presets." # optional item

;Assign language strings to sections
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecMain} $(DESC_SecMain)
;!insertmacro MUI_DESCRIPTION_TEXT ${SecTwo} $(DESC_SecTwo) # optional item
!insertmacro MUI_FUNCTION_DESCRIPTION_END


;--------------------------------
;Uninstaller Section

Section "Uninstall"

;Remove all registry keys
DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}"
DeleteRegKey HKLM "Software\${PRODUCT}"

;Delete the installation directory + all files in it
;Add 'RMDir /r "$INSTDIR\folder\*.*"' for every folder you have added additionaly
RMDir /r "$INSTDIR\*.*"
RMDir "$INSTDIR"

;Delete the appdata directory + files # not required bc we deleted the root parent folder
;RMDir /r "${INSTDIR_DATA}\*.*"
;RMDir "${INSTDIR_DATA}"

;Delete Start Menu Shortcuts
Delete "$SMPROGRAMS\${PRODUCT}\*.*"
RmDir  "$SMPROGRAMS\${PRODUCT}"

SectionEnd


;--------------------------------
;After Installation Function

Function .onInstSuccess

;Open 'Thank you for installing' site or something else
;Download extra required files or open a YouTube link or even open the currently instaled app.

ExecShell "open" "microsoft-edge:${AFTER_INSTALLATION_URL}"

; windows redistributable: 
;ExecShell "open" "microsoft-edge:https://support.microsoft.com/en-us/topic/the-latest-supported-visual-c-downloads-2647da03-1eea-4433-9aff-95f26a218cc0"
; execute an exe file:
;nsExec::Exec '"$0" /C if 1==1 "$INSTDIR\${PRODUCT}.exe"'

FunctionEnd
