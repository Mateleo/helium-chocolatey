$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version    = '0.8.5.1'

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

  checksum64    = '47b8df675e9058d852defa809d16e22e842dff004d790c34e7ef821b501c015e'
  checksumType64= 'sha256'

  silentArgs    = '--do-not-launch-chrome' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs