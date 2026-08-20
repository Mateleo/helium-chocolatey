$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version    = '0.15.6.1'

$url64      = "https://github.com/imputnet/helium-windows/releases/download/$version/Helium_$($version)_x64-installer.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  
  url           = '' 
  url64bit      = $url64

  softwareName  = 'helium*'

  # 32-bit checksum (Empty)
  checksum      = ''
  checksumType  = 'sha256'

  checksum64    = 'a1222eb8faf1ec057d84d724a952c14eb7b242d779c52b36eba25b4c6cb190f1'
  checksumType64= 'sha256'

  # NSIS installer flags:
  # /S - Silent/Headless installation
  # /do-not-launch-chrome - Always passed to setup.exe backend
  silentArgs    = '/S /do-not-launch-chrome' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
