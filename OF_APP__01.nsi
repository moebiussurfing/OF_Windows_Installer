;script based into NsiWindowsInstallerExamples-master
;help:
;https://nsis.sourceforge.io/Docs/Modern%20UI%202/Readme.html

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

;disable autoclose to all read final log
!define MUI_FINISHPAGE_NOAUTOCLOSE

!define MUI_FINISHPAGE_RUN ofxColorManager.exe
;!define MUI_FINISHPAGE_RUN_TEXT enjoy!

!define MUI_FINISHPAGE_SHOWREADME README.md
;!define MUI_FINISHPAGE_SHOWREADME_TEXT text

!define MUI_FINISHPAGE_LINK @moebiussurfing
;Text for a link on the which the user can click to view a website or file.
!define MUI_FINISHPAGE_LINK_LOCATION https://twitter.com/moebiussurfing
;Website or file which the user can select to view using the link. You don't need to put quotes around the filename when it contains spaces.

!define MUI_FINISHPAGE_NOREBOOTSUPPORT ;free some space

;--------------------------------
;General

;Properly display all languages
Unicode true

;Define name of the product
!define PRODUCT "ofxColorManager"

;Define optional URL that will be opened after the installation was successful
!define AFTER_INSTALLATION_URL "https://github.com/moebiussurfing/ofxColorManager"

;Define the main name of the installer
Name "${PRODUCT}"

;Define the directory where the installer should be saved
;OutFile "output\${PRODUCT}_Setup.exe"
OutFile "${PRODUCT}_Setup.exe"

;Define the default installation folder (Windows ProgramFiles example)
InstallDir "$PROGRAMFILES\${PRODUCT}"

;Define optional a directory for program files that change (Windows AppData example)
;!define INSTDIR_DATA "$PROGRAMFILES\${PRODUCT}\\data\"

;Request rights if you want to install the program to program files
RequestExecutionLevel admin

;Show 'console' in installer and uninstaller
ShowInstDetails "show"
ShowUninstDetails "show"

;Get installation folder from registry if available
InstallDirRegKey HKLM "Software\${PRODUCT}" ""


;--------------------------------
;Interface Settings

;Show warning if user wants to abort
!define MUI_ABORTWARNING

;Show all languages, despite user's codepage
;!define MUI_LANGDLL_ALLLANGUAGES

;Use optional a custom icon:
!define MUI_ICON "resources\example_icon_installer.ico" # for the Installer
!define MUI_UNICON "resources\example_icon_uninstaller.ico" # for the later created UnInstaller

;Use optional a custom picture for the 'Welcome' and 'Finish' page:
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
Banner::show "ofxColorManager v1.0"

Banner::getWindow
Pop $1

again:
  IntOp $0 $0 + 1
  Sleep 0.2
  StrCmp $0 100 0 again

GetDlgItem $2 $1 1030
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
;File /oname=$PLUGINSDIR\splash.wav "resources\media\s1.wav" #optional

;splash::show 2000 $PLUGINSDIR\splash1
advsplash::show 1000 100 100 -1 $PLUGINSDIR\splash0
advsplash::show 500 100 100 -1 $PLUGINSDIR\splash1
advsplash::show 500 100 100 -1 $PLUGINSDIR\splash2

Pop $0 ; $0 has '1' if the user closed the splash screen early,
; '0' if everything closed normally, and '-1' if some error occurred.

FunctionEnd


;--------------------------------

;For the installer
!insertmacro MUI_PAGE_WELCOME # simply remove this and other pages if you don't want it
!insertmacro MUI_PAGE_LICENSE "resources\LICENSE" # link to an ANSI encoded license file
!insertmacro MUI_PAGE_COMPONENTS # remove if you don't want to list components to choice
!insertmacro MUI_PAGE_DIRECTORY # ask path and confirmation

Var StartMenuFolder # allow customize shortcut
!insertmacro MUI_PAGE_STARTMENU "Application" $StartMenuFolder

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

;Put the following file in the SetOutPath
;File "..\${PRODUCT}.exe" # auto name
File "..\ofxColorManager.exe"
File "..\*.dll"
File "..\*.ini"
File "..\..\..\README.md"

;OF /data files 
;default location. close to the exe! 
SetOutPath "$INSTDIR\\data" 
File /r "..\data\*.*"
;File "data\assets\fonts\*.*"

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
CreateShortCut "$SMPROGRAMS\${PRODUCT}\ofxColorManager.lnk" "$INSTDIR\ofxColorManager.exe" "" "$INSTDIR\ofxColorManager.exe" 0
;CreateShortCut "$SMPROGRAMS\${PRODUCT}\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT}.exe" "" "$INSTDIR\${PRODUCT}.exe" 0

;README
CreateShortCut "$SMPROGRAMS\${PRODUCT}\README.lnk" "$INSTDIR\README.md" "" "$INSTDIR\README.md" 0

;Create uninstaller
WriteUninstaller "${PRODUCT}_Uninstaller.exe"

SectionEnd

#optional

Section "Extra color palettes files" SecTwo
; Save something else optional to the installation directory.
SetOutPath $INSTDIR
# TODO: add another presets folder
;File "resources\example_file_component_01.txt" 
;Create optional start menu shortcut for other component
;CreateShortCut "$SMPROGRAMS\${PRODUCT}\Other Component.lnk" "$INSTDIR\example_file_component_01.txt" "" "$INSTDIR\example_file_component_01.txt" 0
SectionEnd

; Section "Third component (optional - if no remove this entry)"
;   ; Save files/a file to the Windows AppData folder
;   SetOutPath ${INSTDIR_DATA}
;   File "resources\example_file_component_02.txt"
; SectionEnd


;--------------------------------
;Descriptions

;Language strings
LangString DESC_SecMain ${LANG_ENGLISH} "Main program and data files. Adds an user kit with many colors palette presets."
LangString DESC_SecTwo ${LANG_ENGLISH} "Extra kit with several colors palette presets."

;Assign language strings to sections
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecMain} $(DESC_SecMain)
!insertmacro MUI_DESCRIPTION_TEXT ${SecTwo} $(DESC_SecTwo)
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
;ExecShell "open" "microsoft-edge:${AFTER_INSTALLATION_URL}"
;ExecShell "open" "microsoft-edge:https://www.youtube.com/watch?v=oSvGwpbWEuc"
;nsExec::Exec '"$0" /C if 1==1 "$INSTDIR\${PRODUCT}.exe"'

FunctionEnd
