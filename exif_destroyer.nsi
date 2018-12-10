# define installer name
OutFile "exif_destroyer_setup.exe"

# set %AppData% as install directory
InstallDir $APPDATA\EXIF-Destroyer\

# default section start
Section

# define output path
SetOutPath $INSTDIR

# specify files to go in output path
File exif_destroyer.bat
# specify folders to go in output path
File /r ExifTool

# registry keys and values
# add "EXIF Destroyer" entry to directory right-clic menu
WriteRegStr HKCR "Directory\shell\EXIF-Destroyer" '' '&EXIF Destroyer'
WriteRegStr HKCR "Directory\shell\EXIF-Destroyer" 'Icon' '$SYSDIR\shell32.dll,131'
WriteRegStr HKCR "Directory\shell\EXIF-Destroyer\command" '' '"$INSTDIR\exif_destroyer.bat" "%1"'
# add "EXIF Destroyer" entry to image right-clic menu
WriteRegStr HKCR "SystemFileAssociations\image\shell\EXIF-Destroyer" '' '&EXIF Destroyer'
WriteRegStr HKCR "SystemFileAssociations\image\shell\EXIF-Destroyer" 'Icon' '$SYSDIR\shell32.dll,131'
WriteRegStr HKCR "SystemFileAssociations\image\shell\EXIF-Destroyer\command" '' '"$INSTDIR\exif_destroyer.bat" "%1"'
# add uninstall information to Add/Remove Programs
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\EXIF-Destroyer" "DisplayName" "EXIF-Destroyer"
WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\EXIF-Destroyer" "UninstallString" "$\"$INSTDIR\exif_destroyer_uninstaller.exe$\""

# define uninstaller name
WriteUninstaller $INSTDIR\exif_destroyer_uninstaller.exe

CreateDirectory $SMPROGRAMS\EXIF-Destroyer
# create a shortcut named "Uninstall" in the start menu programs directory
# point the new shortcut at the uninstaller exif_destroyer_uninstaller.exe
CreateShortCut "$SMPROGRAMS\EXIF-Destroyer\Uninstall.lnk" "$INSTDIR\exif_destroyer_uninstaller.exe"

# default section end
SectionEnd

# create a section to define what the uninstaller does.
# the section will always be named "Uninstall"
Section "Uninstall"

# always delete uninstaller first
Delete $INSTDIR\exif_destroyer_uninstaller.exe

# registry keys and values
# delete "EXIF Destroyer" entry from directory right-clic menu
DeleteRegKey HKCR "Directory\shell\EXIF-Destroyer"
# delete "EXIF Destroyer" entry to image right-clic menu
DeleteRegKey HKCR "SystemFileAssociations\image\shell\EXIF-Destroyer"
# remove uninstall information from Add/Remove Programs
DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\EXIF-Destroyer"

# delete installed files
Delete $INSTDIR\exif_destroyer.bat
# delete installed folders
RMDir /r $INSTDIR\ExifTool
RMDir $INSTDIR
# now delete shortcuts
Delete $SMPROGRAMS\EXIF-Destroyer\Uninstall.lnk
RMDir $SMPROGRAMS\EXIF-Destroyer

SectionEnd