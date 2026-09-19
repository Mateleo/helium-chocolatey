$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version    = '0.17.2.1'

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

  checksum64    = '9551aab0637c0976040b1c922dbdb625babb6bbcaee0ccb2f1882efa5c0adb56'
  checksumType64= 'sha256'

  # NSIS installer flags:
  # /S - Silent/Headless installation
  # /do-not-launch-chrome - Always passed to setup.exe backend
  silentArgs    = '/S /do-not-launch-chrome' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
