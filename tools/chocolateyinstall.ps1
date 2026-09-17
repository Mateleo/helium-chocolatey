$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version    = '0.17.1.1'

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

  checksum64    = '5af8a6a5bc45a8ad3609f36a390ff03994cde4ee4314a4b3c7c9159d53cc6cb3'
  checksumType64= 'sha256'

  # NSIS installer flags:
  # /S - Silent/Headless installation
  # /do-not-launch-chrome - Always passed to setup.exe backend
  silentArgs    = '/S /do-not-launch-chrome' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
