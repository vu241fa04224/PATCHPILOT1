@echo off
title PatchPilot Launcher
echo ====================================================
echo        Starting PatchPilot Vulnerability Platform
echo ====================================================

set "BASE_DIR=%~dp0"
if exist "%BASE_DIR%PATCHPILOT1\backend" (
    set "BACKEND_DIR=%BASE_DIR%PATCHPILOT1\backend"
    set "FRONTEND_DIR=%BASE_DIR%PATCHPILOT1\frontend"
) else (
    set "BACKEND_DIR=%BASE_DIR%backend"
    set "FRONTEND_DIR=%BASE_DIR%frontend"
)

echo Starting Backend Server (FastAPI on Port 8000)...
start "PatchPilot Backend (FastAPI)" cmd /k "cd /d ""%BACKEND_DIR%"" && .venv\Scripts\python.exe -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000"

echo Starting Frontend Server (Vite React on Port 5173)...
start "PatchPilot Frontend (Vite)" cmd /k "cd /d ""%FRONTEND_DIR%"" && npm run dev"

echo.
echo ====================================================
echo PatchPilot is launching!
echo.
echo Frontend Web UI:  http://localhost:5173
echo Backend API Docs: http://127.0.0.1:8000/docs
echo.
echo Demonstration Accounts:
echo - Administrator:     admin@patchpilot.local  / Admin@123456
echo - Security Analyst:  analyst@patchpilot.local / Analyst@123456
echo ====================================================
echo.
echo Opening browser in 3 seconds...
timeout /t 3 >nul
start http://localhost:5173
