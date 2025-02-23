# Get the directory of the currently executing PowerShell script
$scriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Build paths
$keyFolderPath = Join-Path -Path $scriptDir -ChildPath "token_keys"
$appdataPaths = Get-ChildItem -Path "C:\Users" -Directory | ForEach-Object { "$($_.FullName)\AppData\" }

# Import all registry files in the subfolder
Get-ChildItem -Path "$keyFolderPath\*.reg" | ForEach-Object {
    Start-Process -FilePath "reg.exe" -ArgumentList "import `"$($_.FullName)`"" -NoNewWindow -Wait
}
Write-Host "All registry keys have been imported successfully!" -ForegroundColor Green

$appdataPathsString = $appdataPaths -join ";"
$filePath = Join-Path -Path $scriptDir -ChildPath "regshot_paths.txt"
$appdataPathsString | Set-Content -Path $filePath -Encoding UTF8

Write-Host "Paths were saved to regshot_paths.txt in the current script directory." -ForegroundColor Green

Write-Host "Restarting explorer.exe..."
Stop-Process -Name explorer -Force
Start-Process explorer.exe

# Start notepad and regshot
Start-Process "notepad.exe" -ArgumentList $filePath
Start-Process -FilePath "$scriptDir\Regshot-x64-ANSI.exe"