$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$version    = '0.9.4.1'

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

  checksum64    = 'ed38db0f007a994aaf9a54a413aeacc3b81c5f6eb267af84fc1a9c62c0d18d2b'
  checksumType64= 'sha256'

  silentArgs    = '--do-not-launch-chrome' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs