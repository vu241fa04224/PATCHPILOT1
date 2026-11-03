Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "       Starting PatchPilot Vulnerability Platform   " -ForegroundColor Green
Write-Host "====================================================" -ForegroundColor Cyan

$baseDir = $PSScriptRoot
if (Test-Path "$baseDir\PATCHPILOT1\backend") {
    $backendDir = "$baseDir\PATCHPILOT1\backend"
    $frontendDir = "$baseDir\PATCHPILOT1\frontend"
} else {
    $backendDir = "$baseDir\backend"
    $frontendDir = "$baseDir\frontend"
}

Write-Host "Starting Backend Server (FastAPI on Port 8000)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$backendDir'; .\.venv\Scripts\python.exe -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000"

Write-Host "Starting Frontend Server (Vite React on Port 5173)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$frontendDir'; npm run dev"

Write-Host "`nPatchPilot is launching!" -ForegroundColor Green
Write-Host "Frontend Web UI:  http://localhost:5173" -ForegroundColor White
Write-Host "Backend API Docs: http://127.0.0.1:8000/docs" -ForegroundColor White
Write-Host "`nDemonstration Accounts:" -ForegroundColor Cyan
Write-Host "  Admin:   admin@patchpilot.local  / Admin@123456"
Write-Host "  Analyst: analyst@patchpilot.local / Analyst@123456"
Write-Host "====================================================" -ForegroundColor Cyan

Start-Sleep -Seconds 3
Start-Process "http://localhost:5173"
