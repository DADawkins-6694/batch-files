@echo off
setlocal enabledelayedexpansion

REM Full Backup Script Using Robocopy

REM === ENSURE PATHS ARE CORRECT ===
set BACKUP_DEST=D:\Backups\FullBackup

REM Create timestamped folder
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set mm=%%a
    set dd=%%b
    set yyyy=%%c
)
set hh=%time:~0,2%
set hh=%hh: =0%
set nn=%time:~3,2%
set ss=%time:~6,2%

set BACKUP_FOLDER=%BACKUP_DEST%\Backup_%yyyy%-%mm%-%dd%_%hh%-%nn%-%ss%

echo ================================================================
echo       FULL SYSTEM BACKUP STARTING
echo ================================================================
echo Backup destination: %BACKUP_FOLDER%
echo.

mkdir "%BACKUP_FOLDER%"

robocopy C:\ "%BACKUP_FOLDER%" /MIR /R:3 /W:5 /XJ /COPYALL

echo.
echo ================================================================
echo BACKUP COMPLETE
echo Files saved to: %BACKUP_FOLDER%
echo ================================================================
echo.

endlocal
exit


REM **********************************************************************************
REM ****** DEV NOTE- DD.20251124.1                                              ******
REM ****** !!!ENSURE BACKUP_DEST (top) IS THE CORRECT FILE PATH!!!              ******
REM ****** Perform full backup of the C:\ drive                                 ******
REM ****** /MIR  = Mirror directory (adds and deletes to match source)          ******
REM ****** /R:3  = Retry 3 times on failed copies                               ******
REM ****** /W:5  = Wait 5 seconds between retries                               ******
REM ****** /XJ   = Exclude junctions (prevents infinite loops)                  ******
REM ****** /COPYALL = Copy all file information (permissions, timestamps, etc.) ******
REM ********************************************************************************** 



