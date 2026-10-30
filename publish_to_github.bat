@echo off
setlocal
echo ========================================================
echo   Wegweiser - Push Updates to GitHub
echo ========================================================
echo.

set "GIT_EXE=C:\Program Files\Git\cmd\git.exe"
set "REPO_DIR=%~dp0"

cd /d "%REPO_DIR%"

echo Checking Git status...
"%GIT_EXE%" status

echo.
set /p COMMIT_MSG="Enter commit message (or press Enter for 'Update curriculum'): "
if "%COMMIT_MSG%"=="" set COMMIT_MSG=Update curriculum

echo.
echo Staging files...
"%GIT_EXE%" add .

echo Committing changes...
"%GIT_EXE%" commit -m "%COMMIT_MSG%"

echo.
echo Pushing to GitHub (main branch)...
"%GIT_EXE%" push origin main

echo.
if %ERRORLEVEL% EQU 0 (
    echo ========================================================
    echo   Successfully updated and published to GitHub!
    echo ========================================================
) else (
    echo [!] Push failed or remote origin not configured yet.
)

pause
