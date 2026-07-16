@echo off

:: 1. Check for Admin privileges. If missing, relaunch as Administrator.
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: 2. Detect the current state by checking if 'HYTE Nexus' is running
tasklist /FI "IMAGENAME eq HYTE Nexus.exe" 2>NUL | find /I /N "HYTE Nexus.exe">NUL
if %errorLevel%==0 (
    goto CLOSE_STATE
) else (
    goto REVERT_STATE
)

:CLOSE_STATE
:: State A: App is open -> Close everything and switch to Screen 2 Only
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "Stop-Process -Name 'HYTE Nexus' -Force -ErrorAction SilentlyContinue; " ^
    "Stop-Process -Name 'HYTE.Nexus.Service' -Force -ErrorAction SilentlyContinue"

DisplaySwitch.exe /external
exit /b

:REVERT_STATE
:: State B: App is closed -> Turn both screens back on and open everything
DisplaySwitch.exe /extend

:: Give Windows 3 seconds to reconfigure the monitors before launching apps
timeout /t 3 /nobreak >nul

powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Service -Name 'HYTE.Nexus.Service' -ErrorAction SilentlyContinue"

start "" "C:\Users\Milo\AppData\Local\Programs\HYTE Nexus\HYTE Nexus.exe"
exit /b
