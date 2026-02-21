$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version    = '0.9.3.1'

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

  checksum64    = '4d8461ef2cd18d6aa4878f70a9e90c66046c38dd0c8955918aa64efb5e966b8c'
  checksumType64= 'sha256'

  silentArgs    = '--do-not-launch-chrome' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs