WindowIcon Off
SilentInstall Silent
AutoCloseWindow True
Name "NSIS Constants"
OutFile "NSIS_Constants.exe"

!define DISABLEREDIR `kernel32::Wow64EnableWow64FsRedirection(i0)`
!define ENABLEREDIR  `kernel32::Wow64EnableWow64FsRedirection(i1)`

Var VER
Section "Main"
    ReadRegStr $0 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion" CurrentVersion
    StrCpy $VER $0
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "Windows" "Version" "$VER"

    SetRegView 64
    ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion" CommonFilesDir
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$COMMONFILES" "64bit COMMONFILES" "$R0"
    SetRegView 32
    ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion" CommonFilesDir
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$COMMONFILES" "32bit COMMONFILES" "$R0"

    SetRegView 64
    ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion" ProgramFilesDir
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PROGRAMFILES" "64bit PROGRAMFILES" "$R0"
    SetRegView 32
    ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion" ProgramFilesDir
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PROGRAMFILES" "32bit PROGRAMFILES" "$R0"

    System::Call `${DISABLEREDIR}`
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SYSDIR" "64bit SYSDIR" "$SYSDIR"
    System::Call `${ENABLEREDIR}`
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SYSDIR" "32bit SYSDIR" "$SYSDIR"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$ADMINTOOLS" "current ADMINTOOLS" "$ADMINTOOLS"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$ADMINTOOLS" "all ADMINTOOLS" "$ADMINTOOLS"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$APPDATA" "current APPDATA" "$APPDATA"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$APPDATA" "all APPDATA" "$APPDATA"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$CDBURN_AREA" "current CDBURN_AREA" "$CDBURN_AREA"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$CDBURN_AREA" "all CDBURN_AREA" "$CDBURN_AREA"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$CMDLINE" "current CMDLINE" "$CMDLINE"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$CMDLINE" "all CMDLINE" "$CMDLINE"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$COMMONFILES" "current COMMONFILES" "$COMMONFILES"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$COMMONFILES" "all COMMONFILES" "$COMMONFILES"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$COOKIES" "current COOKIES" "$COOKIES"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$COOKIES" "all COOKIES" "$COOKIES"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$DESKTOP" "current DESKTOP" "$DESKTOP"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$DESKTOP" "all DESKTOP" "$DESKTOP"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$DOCUMENTS" "current DOCUMENTS" "$DOCUMENTS"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$DOCUMENTS" "all DOCUMENTS" "$DOCUMENTS"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$EXEDIR" "current EXEDIR" "$EXEDIR"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$EXEDIR" "all EXEDIR" "$EXEDIR"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$FAVORITES" "current FAVORITES" "$FAVORITES"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$FAVORITES" "all FAVORITES" "$FAVORITES"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$FONTS" "current FONTS" "$FONTS"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$FONTS" "all FONTS" "$FONTS"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$HISTORY" "current HISTORY" "$HISTORY"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$HISTORY" "all HISTORY" "$HISTORY"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$HWNDPARENT" "current HWNDPARENT" "$HWNDPARENT"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$HWNDPARENT" "all HWNDPARENT" "$HWNDPARENT"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$INSTDIR" "current INSTDIR" "$INSTDIR"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$INSTDIR" "all INSTDIR" "$INSTDIR"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$INTERNET_CACHE" "current INTERNET_CACHE" "$INTERNET_CACHE"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$INTERNET_CACHE" "all INTERNET_CACHE" "$INTERNET_CACHE"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$LANGUAGE" "current LANGUAGE" "$LANGUAGE"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$LANGUAGE" "all LANGUAGE" "$LANGUAGE"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$LOCALAPPDATA" "current LOCALAPPDATA" "$LOCALAPPDATA"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$LOCALAPPDATA" "all LOCALAPPDATA" "$LOCALAPPDATA"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$MUSIC" "current MUSIC" "$MUSIC"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$MUSIC" "all MUSIC" "$MUSIC"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$NETHOOD" "current NETHOOD" "$NETHOOD"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$NETHOOD" "all NETHOOD" "$NETHOOD"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$OUTDIR" "current OUTDIR" "$OUTDIR"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$OUTDIR" "all OUTDIR" "$OUTDIR"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PICTURES" "current PICTURES" "$PICTURES"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PICTURES" "all PICTURES" "$PICTURES"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PLUGINSDIR" "current PLUGINSDIR" "$PLUGINSDIR"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PLUGINSDIR" "all PLUGINSDIR" "$PLUGINSDIR"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PRINTHOOD" "current PRINTHOOD" "$PRINTHOOD"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PRINTHOOD" "all PRINTHOOD" "$PRINTHOOD"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PROFILE" "current PROFILE" "$PROFILE"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PROFILE" "all PROFILE" "$PROFILE"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PROGRAMFILES" "current PROGRAMFILES" "$PROGRAMFILES"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$PROGRAMFILES" "all PROGRAMFILES" "$PROGRAMFILES"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$QUICKLAUNCH" "current QUICKLAUNCH" "$QUICKLAUNCH"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$QUICKLAUNCH" "all QUICKLAUNCH" "$QUICKLAUNCH"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$RECENT" "current RECENT" "$RECENT"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$RECENT" "all RECENT" "$RECENT"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$RESOURCES" "current RESOURCES" "$RESOURCES"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$RESOURCES" "all RESOURCES" "$RESOURCES"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$RESOURCES_LOCALIZED" "current RESOURCES_LOCALIZED" "$RESOURCES_LOCALIZED"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$RESOURCES_LOCALIZED" "all RESOURCES_LOCALIZED" "$RESOURCES_LOCALIZED"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SENDTO" "current SENDTO" "$SENDTO"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SENDTO" "all SENDTO" "$SENDTO"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SMPROGRAMS" "current SMPROGRAMS" "$SMPROGRAMS"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SMPROGRAMS" "all SMPROGRAMS" "$SMPROGRAMS"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SMSTARTUP" "current SMSTARTUP" "$SMSTARTUP"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SMSTARTUP" "all SMSTARTUP" "$SMSTARTUP"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$STARTMENU" "current STARTMENU" "$STARTMENU"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$STARTMENU" "all STARTMENU" "$STARTMENU"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SYSDIR" "current SYSDIR" "$SYSDIR"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$SYSDIR" "all SYSDIR" "$SYSDIR"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$TEMP" "current TEMP" "$TEMP"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$TEMP" "all TEMP" "$TEMP"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$TEMPLATES" "current TEMPLATES" "$TEMPLATES"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$TEMPLATES" "all TEMPLATES" "$TEMPLATES"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$VIDEOS" "current VIDEOS" "$VIDEOS"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$VIDEOS" "all VIDEOS" "$VIDEOS"

    SetShellVarContext current
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$WINDIR" "current WINDIR" "$WINDIR"
    SetShellVarContext all
    WriteINIStr $EXEDIR\Windows_$VER_Constants.ini "$$WINDIR" "all WINDIR" "$WINDIR"

    MessageBox MB_USERICON "NSIS Constants for this computer are in Windows_$VER_Constants.ini"

SectionEnd