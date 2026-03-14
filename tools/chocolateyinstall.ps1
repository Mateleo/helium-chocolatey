$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version    = '0.10.4.1'

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

  checksum64    = 'a996b01d6325f885ec70fb56303479ee32f604767d372450875b033fe4687631'
  checksumType64= 'sha256'

  silentArgs    = '--do-not-launch-chrome' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs