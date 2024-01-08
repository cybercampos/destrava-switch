$drive = Read-Host "Escolha o Drive para colocar a destrava"

if (Test-Path -Path $drive -PathType Container) {
  Write-Output "Baixando Destrava"

  $outputFilePath = Join-Path $PWD "CNX.17.0.0-1.zip"

  Invoke-WebRequest -Uri "https://github.com/cybercampos/destrava-switch/raw/main/CNX.17.0.0-1.zip" -OutFile $outputFilePath

  if (-not (Test-Path -Path $drive -PathType Container)) {
    New-Item -Path $drive -ItemType Directory | Out-Null
  }

  Expand-Archive -Path $outputFilePath -DestinationPath $drive

  Write-Output "Destrava instalada e descompactada!"

  Remove-Item $outputFilePath
}
else {
  Write-Output "O drive não existe ou não é um diretório!"
}
