@echo off

REM Open Outlook
start "" "C:\Shortcuts\Outlook.lnk"

REM wait 3 seconds
timeout /t 3 /nobreak >nul

REM Open Google Calendar
start "" "C:\Shortcuts\Google Calendar.lnk"

REM wait 3 seconds
timeout /t 3 /nobreak >nul

REM Open LinkedIn
start "" "C:\Shortcuts\LinkedIn.lnk"

REM wait 3 seconds
timeout /t 3 /nobreak >nul

REM Open Discord
start "" "C:\Shortcuts\Discord.lnk"

REM wait 3 seconds
timeout /t 3 /nobreak >nul

REM Open WGU Degree Plan in Google Chrome
start "" "C:\Shortcuts\Google Chrome.lnk" https://my.wgu.edu/degree-plan

REM wait 3 seconds
timeout /t 3 /nobreak >nul

REM Show a message box
powershell -NoProfile -STA -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Step Forward and Seize the Day!')"

REM ************************************************************ 
REM ****** DEV NOTE- DD.20251124.1                        ******
REM ****** This will only work if the links are correct   ******
REM ****** for the device that it is actively running on. ******
REM ************************************************************
