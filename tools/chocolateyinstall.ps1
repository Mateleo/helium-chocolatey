$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version    = '0.14.4.1'

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

  checksum64    = '60bcb61253e10612747c2fae8635cfea9cc77e31d8dfa66a19ce6f63ecd1dc9b'
  checksumType64= 'sha256'

  # NSIS installer flags:
  # /S - Silent/Headless installation
  # /do-not-launch-chrome - Always passed to setup.exe backend
  silentArgs    = '/S /do-not-launch-chrome' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
