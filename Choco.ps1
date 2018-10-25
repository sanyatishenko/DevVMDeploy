<##############################################################################
#
#  Function download installer Chocolatey and install Git.
#  For manual mode, function open in browser download page for Git.
#  
################################################################################>
Function Install-Git {

[CmdletBinding(DefaultParameterSetName="ChocoInstall")]
Param(
      [parameter(ParameterSetName="ManualInstall")][switch]$Manual,
      [parameter(ParameterSetName="ChocoReInstall")][switch]$Force
      
)

Switch ($PSCmdlet.ParameterSetName){

"ManualInstall" {
    Start-Process -FilePath "https://git-scm.com/downloads"
    } #End ManualInstall Switch 1

default {
    #Choco alredy installed ?
    $s = $env:ProgramData + '\chocolatey\bin\chocolatey.exe'
    if (-not (Get-Item $s -ErrorAction Ignore)) {
        Write-Host "Choco not installed" -ForegroundColor DarkMagenta
        Set-ExecutionPolicy Bypass -Scope Process -Force
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    } else {
        Write-Host "Choco alredy installed" -ForegroundColor DarkMagenta
    }

    Switch ($PSCmdlet.ParameterSetName){

    "ChocoReInstall"{
        Write-Host "Install Git with parameter -Force" -ForegroundColor DarkMagenta
        choco install -y git.install --force
        } #EndChocoReInstall

    "ChocoInstall"{
        Write-Host "Install Git with parameter" -ForegroundColor DarkMagenta
        choco install -y git.install
        }#EndChocoInstall

    }#EndSwitch2

  }#End Default Switch 1

}#EndSwitch 1


}#EndFunction Install-git

Install-Git




