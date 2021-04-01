  ;base on NsiWindowsInstallerExamples-master

  ;--------------------------------
  ;Include Modern UI

    !include "MUI2.nsh"


  ;--------------------------------
  ;General

    ;Properly display all languages
    Unicode true

    ;Define name of the product
    !define PRODUCT "ofxColorManager"

    ;Define optional URL that will be opened after the installation was successful
    !define AFTER_INSTALLATION_URL "https://github.com/moebiussurfing/ofxColorManager"

  ;!define HELPURL "http://..." # "Support Information" link
  ;!define UPDATEURL "http://..." # "Product Updates" link
  ;!define ABOUTURL "http://..." # "Publisher" link

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

    ;Properly display all languages
    Unicode true

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
    !define MUI_LANGDLL_ALLLANGUAGES

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

    ;For the installer
    !insertmacro MUI_PAGE_WELCOME # simply remove this and other pages if you don't want it
    !insertmacro MUI_PAGE_LICENSE "resources\LICENSE" # link to an ANSI encoded license file
    
    !insertmacro MUI_PAGE_COMPONENTS # remove if you don't want to list components

    !insertmacro MUI_PAGE_DIRECTORY # ask path and confirmation
    ;!insertmacro MUI_UNPAGE_CONFIRM

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
    !insertmacro MUI_LANGUAGE "French"
    !insertmacro MUI_LANGUAGE "German"
    !insertmacro MUI_LANGUAGE "Spanish"


  ;--------------------------------
  ;Installer Section

  Section "Main Component"
    SectionIn RO # Just means if in component mode this is locked

    ;Set output path to the installation directory.
    SetOutPath $INSTDIR

    ;Put the following file in the SetOutPath
    File "..\ofxColorManager.exe"
    ;File "resources\example_file_component_01.txt"

    ;File "..\${PRODUCT}.exe"
    File "..\*.dll"
    File "..\*.ini"

    SetOutPath "$INSTDIR\\data" 
    File /r "..\data\*.*"
    ;File "data\assets\fonts\*.*"
    ;File "..\example_resources\example_file_component_02.txt"

    ;Store installation folder in registry
    WriteRegStr HKLM "Software\${PRODUCT}" "" $INSTDIR

    ;Registry information for add/remove programs
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "DisplayName" "${PRODUCT}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "UninstallString" '"$INSTDIR\${PRODUCT}_uninstall.exe"'
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "NoRepair" 1

    ;Create optional start menu shortcut for uninstaller and Main component
    CreateDirectory "$SMPROGRAMS\${PRODUCT}"
    ;CreateShortCut "$SMPROGRAMS\${PRODUCT}\Main Component.lnk" "$INSTDIR\example_file_component_01.txt" "" "$INSTDIR\example_file_component_01.txt" 0
    CreateShortCut "$SMPROGRAMS\${PRODUCT}\Uninstall ${PRODUCT}.lnk" "$INSTDIR\${PRODUCT}_Uninstaller.exe" "" "$INSTDIR\${PRODUCT}_Uninstaller.exe" 0

    ;main shorcut
    CreateShortCut "$SMPROGRAMS\${PRODUCT}\ofxColorManager.lnk" "$INSTDIR\ofxColorManager.exe" "" "$INSTDIR\ofxColorManager.exe" 0
    ;CreateShortCut "$SMPROGRAMS\${PRODUCT}\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT}.exe" "" "$INSTDIR\${PRODUCT}.exe" 0
    ;CreateShortCut "$SMPROGRAMS\${PRODUCT}\${PRODUCT}.lnk" "$INSTDIR\${PRODUCT}.exe" 

    ;Create uninstaller
    WriteUninstaller "${PRODUCT}_Uninstaller.exe"

  SectionEnd


  ; Section "Second component (optional - if no remove this entry)"

  ;   ; Save something else optional to the installation directory.
  ;   SetOutPath $INSTDIR

  ;   File "resources\example_file_component_01.txt"

  ;   ;Create optional start menu shortcut for other component
  ;   CreateShortCut "$SMPROGRAMS\${PRODUCT}\Other Component.lnk" "$INSTDIR\example_file_component_01.txt" "" "$INSTDIR\example_file_component_01.txt" 0

  ; SectionEnd

  ; Section "Third component (optional - if no remove this entry)"

  ;   ; Save files/a file to the Windows AppData folder
  ;   SetOutPath ${INSTDIR_DATA}

  ;   File "resources\example_file_component_02.txt"

  ; SectionEnd


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

    ;Delete the appdata directory + files
  ;  RMDir /r "${INSTDIR_DATA}\*.*"
  ;  RMDir "${INSTDIR_DATA}"

    ;Delete Start Menu Shortcuts
    Delete "$SMPROGRAMS\${PRODUCT}\*.*"
    RmDir  "$SMPROGRAMS\${PRODUCT}"

  SectionEnd


  ;--------------------------------
  ;After Installation Function

   Function .onInstSuccess

  ;   ;Open 'Thank you for installing' site or something else
    ; ExecShell "open" "microsoft-edge:${AFTER_INSTALLATION_URL}"
    ; ExecShell "open" "microsoft-edge:https://www.youtube.com/watch?v=oSvGwpbWEuc"
   ;nsExec::Exec '"$0" /C if 1==1 "$INSTDIR\${PRODUCT}.exe"'

   FunctionEnd