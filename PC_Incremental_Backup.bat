@echo off
setlocal enabledelayedexpansion

REM Incremental Backup Script Using Robocopy


REM === ENSURE PATHS ARE CORRECT ===
set SOURCE=C:\
set BACKUP_ROOT=D:\Backups\IncrementalBackup
set TIMESTAMP_FILE=C:\Backups\LastBackup.timestamp


REM Create backup root if missing
if not exist "%BACKUP_ROOT%" mkdir "%BACKUP_ROOT%"

REM Create the timestamp file if it doesn't exist
if not exist "%TIMESTAMP_FILE%" (
    echo Creating timestamp file for first backup...
    echo First run >> "%TIMESTAMP_FILE%"
)

REM Generate timestamp for folder name
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set mm=%%a
    set dd=%%b
    set yyyy=%%c
)
set hh=%time:~0,2%
set hh=%hh: =0%
set nn=%time:~3,2%
set ss=%time:~6,2%

set BACKUP_FOLDER=%BACKUP_ROOT%\Inc_%yyyy%-%mm%-%dd%_%hh%-%nn%-%ss%

echo ================================================================
echo            INCREMENTAL BACKUP STARTING
echo ================================================================
echo Source directory:      %SOURCE%
echo Last backup timestamp: %TIMESTAMP_FILE%
echo Saving to:             %BACKUP_FOLDER%
echo.

mkdir "%BACKUP_FOLDER%"


robocopy "%SOURCE%" "%BACKUP_FOLDER%" /E /XO /R:3 /W:5 /COPYALL /XJ

echo.
echo Backup complete! Updating timestamp...
echo.

REM Update timestamp after successful backup
type nul > "%TIMESTAMP_FILE%"

echo ================================================================
echo INCREMENTAL BACKUP FINISHED
echo Files saved to: %BACKUP_FOLDER%
echo New timestamp written to: %TIMESTAMP_FILE%
echo ================================================================

endlocal
exit





REM **********************************************************************************
REM ****** DEV NOTE- DD.20251124.1                                              ******
REM ****** !!!ENSURE SOURCE (top) IS THE CORRECT FILE PATH!!!                   ******
REM ****** !!!ENSURE BACKUP_ROOT (top) IS THE CORRECT FILE PATH!!!              ******
REM ****** !!!ENSURE TIMESTAMP_FILE (top) IS THE CORRECT FILE PATH!!!           ******
REM ****** Perform differential backup of the C:\ drive                         ******
REM ****** /E    = Copy all subfolders                                          ******
REM ****** /XO   = Exclude older files (only copy files newer than full backup) ******
REM ****** /R:3  = Retry 3 times on failed copies                               ******
REM ****** /W:5  = Wait 5 seconds between retries                               ******
REM ****** /XJ   = Exclude junctions (prevents infinite loops)                  ******
REM ****** /COPYALL = Copy all file information (permissions, timestamps, etc.) ******
REM ****** /MAXAGE  = Only include files newer than timestamp                   ******
REM **********************************************************************************


