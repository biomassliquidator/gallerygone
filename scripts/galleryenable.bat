@echo off
setlocal enabledelayedexpansion

:: Description and prompt for user confirmation
echo This script will return the Gallery to the File Explorer sidebar in Windows 11.
echo.
set /p confirm="Do you want to continue with this action? (y/n): "
if /i "%confirm%"=="y" (
    echo Adding the Gallery back to File Explorer...
    goto RunScript
) else (
    echo Exiting script. No changes will be made.
    exit
)

:RunScript
:: Enable Gallery in File Explorer (Windows 11)
echo Enabling Gallery in File Explorer...

:: Add the registry key that enables Gallery
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}
echo Gallery has been removed from the File Explorer sidebar.

:: Restart File Explorer to apply the changes
echo Restarting File Explorer to apply changes...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe
echo File Explorer has been restarted.

pause
exit
