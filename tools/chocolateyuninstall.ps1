$ErrorActionPreference = 'Stop'
$packageName = $env:ChocolateyPackageName
$softwareName = 'Helium'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = $softwareName
  fileType      = 'EXE'
  silentArgs    = '--uninstall --force-uninstall' 
  validExitCodes= @(0, 19)
}

[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs['softwareName']

if ($key.Count -ge 1) {
    $key | ForEach-Object {
        $uninstallString = $_.UninstallString
        if ($uninstallString -match '"') {
            $packageArgs['file'] = ($uninstallString -split '"')[1]
        } else {
            $packageArgs['file'] = $uninstallString
        }

        if (Test-Path $packageArgs['file']) {
            try {
                Uninstall-ChocolateyPackage @packageArgs
            } catch {
                Write-Warning "Standard uninstaller failed. Proceeding to manual cleanup..."
            }
        }
    }
}

$userPath   = "$env:LOCALAPPDATA\imput\Helium"
$systemPath = "$env:ProgramFiles\Helium"

if (Test-Path $userPath) {
    Write-Host "Removing leftover User files..."
    Remove-Item -Path $userPath -Recurse -Force -ErrorAction SilentlyContinue
}
if (Test-Path $systemPath) {
    Write-Host "Removing leftover System files..."
    Remove-Item -Path $systemPath -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "Uninstall complete."