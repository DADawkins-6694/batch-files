@echo off

start "" "C:\Shortcuts\Outlook.lnk"

timeout /t 3 /nobreak >nul

start "" "C:\Shortcuts\LinkedIn.lnk"

timeout /t 3 /nobreak >nul

start "" "C:\Shortcuts\Discord.lnk"

timeout /t 3 /nobreak >nul

start "" "C:\Shortcuts\Google Chrome.lnk" "https://calendar.google.com/calendar/u/0/r"

timeout /t 3 /nobreak >nul

powershell -NoProfile -STA -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Step Forward and Seize the Day!')"

************************************************************ 
****** DEV NOTE- DD.20251124.1                        ******
****** This will only work if the links are correct   ******
****** for the device that it is actively running on. ******
************************************************************
