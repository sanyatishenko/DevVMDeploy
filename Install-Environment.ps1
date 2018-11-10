Function Install-Environment () { 

    Param(
        [string]$Path
    )
    #Choco alredy installed ?

    $s = $env:ProgramData + '\chocolatey\bin\chocolatey.exe'

    if (-not (Get-Item $s -ErrorAction Ignore)) {
        Write-Host "Choco not installed" -ForegroundColor DarkMagenta
        Set-ExecutionPolicy Bypass -Scope Process -Force
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    } else {
        Write-Host "Choco alredy installed" -ForegroundColor DarkMagenta
    }

    [array]$list = Get-Content $Path
    foreach ($item in $list) {
        $item = $item.Trim(" ","`t")
        if ($item -and ($item[0] -ne '#')){
            Write-Host "------------------------------------" -ForegroundColor DarkMagenta
            Write-Host "Execute command: choco install -y $item --force" -ForegroundColor DarkMagenta
            choco install -y $item --force
        }
    }
}
