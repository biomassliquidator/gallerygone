@echo off
:: Check if the script is running as Administrator
NET SESSION >nul 2>nul
if %errorlevel% NEQ 0 (
    echo This script needs to be run as Administrator to work correctly.
    pause
    exit /b
)

:: Prompt for user input
echo Please choose an option:
echo 1. Disable Gallery in the Windows File Explorer.
echo 2. Enable Gallery in the Windows File Explorer.
set /p choice=Enter your choice (1 or 2):

if "%choice%"=="1" (
    call :RunAsAdmin "%~dp0scripts\gallerydisable.bat"
) else if "%choice%"=="2" (
    call :RunAsAdmin "%~dp0scripts\galleryenable.bat"
) else (
    echo Invalid choice. Please enter 1 or 2.
)

:: Subroutine to elevate a script to run as administrator
:RunAsAdmin
set script=%1
:: Check if the script is running as Administrator
NET SESSION >nul 2>nul
if %errorlevel% NEQ 0 (
    echo Running %script% as Administrator...
    :: Re-launch this batch script as administrator and pass the script to run
    setlocal
    set batchfile=%~f0
    set params=%script%
    echo Set batchfile=%batchfile% params=%params%
    :: Run the script as administrator
    start "" "%batchfile%" %params%
    endlocal
    exit /b
)

:: If already running as Admin, simply run the script
call %script%
exit /b
