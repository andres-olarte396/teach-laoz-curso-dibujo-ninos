param(
    [string]$Root = "$(Split-Path -Parent $PSScriptRoot)\modulos",
    [string]$VoiceName = "Microsoft Sabina Desktop"
)

Write-Host "Generando audios TTS desde: $Root" -ForegroundColor Cyan

$spVoice = New-Object -ComObject SAPI.SpVoice
$spFileStream = New-Object -ComObject SAPI.SpFileStream

# Selección de voz
$token = $spVoice.GetVoices().Item(0)
foreach ($v in @($spVoice.GetVoices())) {
    if ($v.GetDescription() -like "*$VoiceName*") { $token = $v; break }
}
$spVoice.Voice = $token
$spVoice.Rate = 0
$spVoice.Volume = 100

$txtFiles = Get-ChildItem -Path $Root -Filter "*_guion.txt" -Recurse
if (-not $txtFiles) { Write-Host "No se encontraron archivos *_guion.txt" -ForegroundColor Yellow; exit 0 }

foreach ($txt in $txtFiles) {
    $outWav = [System.IO.Path]::ChangeExtension($txt.FullName, ".wav")
    Write-Host "TTS -> $outWav" -ForegroundColor Green

    $content = Get-Content -Raw -Path $txt.FullName

    # Abrir stream de salida (22kHz mono PCM)
    $SAFT22kHz16BitMono = 39
    $spFileStream.Format.Type = $SAFT22kHz16BitMono
    $spFileStream.Open($outWav, 3, $false)

    $spVoice.AudioOutputStream = $spFileStream
    $spVoice.Speak($content) | Out-Null
    $spVoice.AudioOutputStream = $null
    $spFileStream.Close()
}

Write-Host "Audios generados correctamente." -ForegroundColor Cyan