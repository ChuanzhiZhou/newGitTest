@echo off
chcp 65001 >nul

:: 设置备份目录和项目信息
set BACKUP_DIR=%USERPROFILE%\novel_backups
set PROJECT_DIR=%CD%
set DATETIME=%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set DATETIME=%DATETIME: =0%
set BACKUP_NAME=novel_backup_%DATETIME%

echo 🔄 ===== 小说项目自动备份 ===== 🔄
echo.

:: 创建备份目录
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

echo 📁 备份目录: %BACKUP_DIR%
echo 📅 备份时间: %date% %time:~0,8%
echo.

:: 检查Git状态
if exist .git (
    git status --porcelain | findstr /r "." >nul
    if not errorlevel 1 (
        echo ⚠️  检测到未提交的更改，建议先提交到Git
        echo 未提交的文件:
        git status --porcelain
        echo.
        set /p continue_backup="是否继续备份? (y/n): "
        if /i not "%continue_backup%"=="y" (
            echo ❌ 备份已取消
            pause
            exit /b 1
        )
    )
) else (
    echo ⚠️  当前目录不是Git仓库，建议运行 git init
)

:: 创建Git备份
if exist .git (
    echo 📦 创建Git版本备份...
    git bundle create "%BACKUP_DIR%\%BACKUP_NAME%.bundle" --all >nul 2>&1
    if not errorlevel 1 (
        echo ✅ Git备份完成: %BACKUP_NAME%.bundle
    ) else (
        echo ❌ Git备份失败
    )
) else (
    echo ⏭️  跳过Git备份（无Git仓库）
)

:: 创建文件夹备份（使用7zip或WinRAR，如果可用的话）
echo 📂 创建文件夹备份...

:: 检查是否有压缩工具
where 7z >nul 2>&1
if not errorlevel 1 (
    7z a "%BACKUP_DIR%\%BACKUP_NAME%.7z" . -xr!.git >nul
    echo ✅ 文件夹备份完成: %BACKUP_NAME%.7z
) else (
    where powershell >nul 2>&1
    if not errorlevel 1 (
        powershell -command "Compress-Archive -Path '.' -DestinationPath '%BACKUP_DIR%\%BACKUP_NAME%.zip' -Force"
        echo ✅ 文件夹备份完成: %BACKUP_NAME%.zip
    ) else (
        echo ❌ 未找到压缩工具，请安装7zip或使用PowerShell
    )
)

:: 生成备份信息
echo 生成备份信息...
(
    echo 备份信息
    echo =======
    echo 备份时间: %date% %time%
    echo 项目路径: %PROJECT_DIR%
    if exist .git (
        echo Git分支: 
        git branch --show-current 2>nul
        echo 最近提交: 
        git log -1 --pretty=format:"%%h - %%s (%%cr)" 2>nul
    )
    echo 文件数量: 
    dir /s /b *.md 2>nul | find /c /v ""
    echo.
    echo 文件列表:
    dir /s /b *.md 2>nul
    echo.
    if exist .git (
        echo 最近5次提交:
        git log --oneline -5 2>nul
    )
) > "%BACKUP_DIR%\%BACKUP_NAME%_info.txt"

echo 📝 备份信息已生成: %BACKUP_NAME%_info.txt

:: 清理旧备份（保留最近10个）
echo.
echo 🧹 清理旧备份文件...
pushd "%BACKUP_DIR%"
for /f "skip=10 delims=" %%f in ('dir /b /o-d novel_backup_*.bundle 2^>nul') do del "%%f" 2>nul
for /f "skip=10 delims=" %%f in ('dir /b /o-d novel_backup_*.7z 2^>nul') do del "%%f" 2>nul
for /f "skip=10 delims=" %%f in ('dir /b /o-d novel_backup_*.zip 2^>nul') do del "%%f" 2>nul
for /f "skip=10 delims=" %%f in ('dir /b /o-d novel_backup_*_info.txt 2^>nul') do del "%%f" 2>nul
popd

:: 显示备份统计
echo 📊 备份统计:
pushd "%BACKUP_DIR%"
dir /b novel_backup_*.bundle 2>nul | find /c /v "" > temp_count.txt
set /p backup_count=<temp_count.txt
del temp_count.txt
echo    当前备份数量: %backup_count%
echo    最新备份: %BACKUP_NAME%
popd

echo.
echo ✨ 备份完成！备份文件保存在: %BACKUP_DIR% ✨

:: 可选：推送到远程仓库
if exist .git (
    set /p push_remote="🌐 是否推送到远程Git仓库? (y/n): "
    if /i "%push_remote%"=="y" (
        git remote -v | findstr origin >nul
        if not errorlevel 1 (
            echo 📤 推送到远程仓库...
            git push origin --all
            git push origin --tags
            echo ✅ 远程推送完成
        ) else (
            echo ⚠️  未找到远程仓库配置
        )
    )
)

echo.
echo 🎉 备份流程全部完成！ 🎉
pause