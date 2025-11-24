@echo off
setlocal enabledelayedexpansion

REM Differential Backup Script Using Robocopy


REM === ENSURE PATHS ARE CORRECT ===
set SOURCE=C:\
set FULL_BACKUP=D:\Backups\FullBackup
set DIFF_BACKUP=D:\Backups\DifferentialBackup

REM Create timestamp for differential backup folder
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set mm=%%a
    set dd=%%b
    set yyyy=%%c
)
set hh=%time:~0,2%
set hh=%hh: =0%
set nn=%time:~3,2%
set ss=%time:~6,2%

set DIFF_FOLDER=%DIFF_BACKUP%\Diff_%yyyy%-%mm%-%dd%_%hh%-%nn%-%ss%

echo ================================================================
echo              DIFFERENTIAL BACKUP STARTING
echo ================================================================
echo Source: %SOURCE%
echo Full backup: %FULL_BACKUP%
echo Diff destination: %DIFF_FOLDER%
echo.

mkdir "%DIFF_FOLDER%"


robocopy "%SOURCE%" "%DIFF_FOLDER%" /E /XO /R:3 /W:5 /COPYALL /XJ

echo.
echo ================================================================
echo DIFFERENTIAL BACKUP COMPLETE
echo Files saved to: %DIFF_FOLDER%
echo ================================================================
echo.

endlocal
exit




REM **********************************************************************************
REM ****** DEV NOTE- DD.20251124.1                                              ******
REM ****** !!!ENSURE SOURCE (top) IS THE CORRECT FILE PATH!!!                   ******
REM ****** !!!ENSURE FULL_BACKUP (top) IS THE CORRECT FILE PATH!!!              ******
REM ****** !!!ENSURE DIFF_BACKUP (top) IS THE CORRECT FILE PATH!!!              ******
REM ****** Perform differential backup of the C:\ drive                         ******
REM ****** /E    = Copy all subfolders                                          ******
REM ****** /XO   = Exclude older files (only copy files newer than full backup) ******
REM ****** /R:3  = Retry 3 times on failed copies                               ******
REM ****** /W:5  = Wait 5 seconds between retries                               ******
REM ****** /XJ   = Exclude junctions (prevents infinite loops)                  ******
REM ****** /COPYALL = Copy all file information (permissions, timestamps, etc.) ******
REM **********************************************************************************


