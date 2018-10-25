<##############################################################################
#
#  Function download installer for browser "Chrome" in the TMP dir and run it.
#  After installation, the installer is removed!
#  
################################################################################>
Function Install-Chrome {
    
    $Path = $env:TEMP; 
    $Installer = "$path\chrome_installer.exe"; 
    Invoke-WebRequest "https://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $Installer; 
    Start-Process -FilePath $Installer -Args "/silent /install" -Verb RunAs -Wait; 
    Remove-Item $Installer

}