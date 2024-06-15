@echo off
setlocal

REM Get the directory of the .bat file
set SCRIPT_DIR=%~dp0

REM Change to the mods directory (assumes mods folder is in the same directory as the .bat file)
cd /d %SCRIPT_DIR%

REM Check if the current folder is a Git repository
if exist .git (
    echo "正在更新服务器模组..."
    git reset --hard
    git clean -fdx
    git pull
) else (
    echo "正在下载服务器模组..."
    git clone https://github.com/wheatup/mods.git .
)

endlocal