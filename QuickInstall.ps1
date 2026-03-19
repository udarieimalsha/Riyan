# Riyan Revit Tools - Instant Setup Script
# This is a safe, script-based installer for your team.

$ExtensionSource = ".\Riyan.extension"
$RevitExtensionsDir = "$env:APPDATA\pyRevit\Extensions"
$TargetDir = Join-Path $RevitExtensionsDir "Riyan.extension"

Write-Host "--- Riyan Revit Tools - Fast Installer ---" -ForegroundColor Cyan

# 1. Create directory if missing
if (-not (Test-Path $RevitExtensionsDir)) {
    Write-Host "Creating pyRevit Extensions directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $RevitExtensionsDir -Force | Out-Null
}

# 2. Copy the extension files
Write-Host "Installing plugin to: $TargetDir" -ForegroundColor Green
if (Test-Path $TargetDir) {
    Remove-Item -Path $TargetDir -Recurse -Force -ErrorAction SilentlyContinue
}
Copy-Item -Path $ExtensionSource -Destination $TargetDir -Recurse -Force

# 3. Finalize
Write-Host "Done! Please Reload pyRevit to see the changes." -ForegroundColor Green
Write-Host "Installation location: $TargetDir" -ForegroundColor Gray
Pause
