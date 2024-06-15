@echo off
setlocal

REM Get the directory of the .bat file
set SCRIPT_DIR=%~dp0

REM Change to the mods directory (assumes mods folder is in the same directory as the .bat file)
cd /d %SCRIPT_DIR%

REM Clean untracked files and directories, then pull updates from remote
git reset --hard
git clean -fdx
git pull

endlocal