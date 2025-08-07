@echo off
chcp 65001 >nul

echo 🚀 ===== Git仓库初始化设置 ===== 🚀
echo.

:: 检查是否已是Git仓库
if exist .git (
    echo ✅ 当前目录已经是Git仓库
    git status
    echo.
    set /p reinit="是否要重新配置Git设置? (y/n): "
    if /i not "%reinit%"=="y" (
        echo 退出设置...
        pause
        exit /b 0
    )
) else (
    echo 📁 当前目录还不是Git仓库，开始初始化...
    git init
    echo ✅ Git仓库初始化完成
)

echo.

:: 设置用户信息
echo 👤 设置Git用户信息...
set /p username="请输入你的姓名: "
set /p email="请输入你的邮箱: "

git config user.name "%username%"
git config user.email "%email%"

echo ✅ 用户信息设置完成:
echo    姓名: %username%
echo    邮箱: %email%

echo.

:: 创建.gitignore文件
echo 📄 创建.gitignore文件...
(
    echo # 临时文件
    echo *.tmp
    echo *.bak
    echo *.swp
    echo *.swo
    echo *~
    echo.
    echo # 系统文件
    echo .DS_Store
    echo Thumbs.db
    echo desktop.ini
    echo.
    echo # 编辑器配置
    echo .vscode/
    echo .idea/
    echo *.sublime-project
    echo *.sublime-workspace
    echo.
    echo # 个人笔记^(不想公开的^)
    echo drafts/personal_notes.md
    echo drafts/private_thoughts.md
    echo.
    echo # 备份文件
    echo backup/
    echo *.backup
    echo.
    echo # 日志文件
    echo *.log
    echo.
    echo # 临时导出文件
    echo export/
    echo output/
) > .gitignore

echo ✅ .gitignore文件创建完成

echo.

:: 添加所有文件并提交
echo 📦 添加文件到Git仓库...
git add .
git status

echo.
set /p commit_msg="请输入初始提交信息 (默认: 初始化小说写作项目): "
if "%commit_msg%"=="" set commit_msg=初始化小说写作项目

git commit -m "%commit_msg%"

echo ✅ 初始提交完成！

echo.
echo 🌐 Git远程仓库设置 (可选)
echo 如果你想要将项目推送到GitHub、GitLab等平台：
echo.
echo 1. 在平台上创建新的空仓库
echo 2. 复制仓库的HTTPS或SSH地址  
echo 3. 运行以下命令添加远程仓库：
echo    git remote add origin [你的仓库地址]
echo    git branch -M main
echo    git push -u origin main
echo.

set /p setup_remote="现在要设置远程仓库吗? (y/n): "
if /i "%setup_remote%"=="y" (
    set /p remote_url="请输入远程仓库地址: "
    git remote add origin "%remote_url%"
    git branch -M main
    echo 远程仓库已添加: %remote_url%
    echo.
    set /p push_now="现在推送到远程仓库吗? (y/n): "
    if /i "%push_now%"=="y" (
        git push -u origin main
        echo ✅ 推送完成！
    )
)

echo.
echo 🎉 Git设置全部完成！
echo.
echo 📋 常用Git命令参考：
echo    git status          - 查看文件状态
echo    git add .           - 添加所有更改
echo    git commit -m "信息" - 提交更改
echo    git push            - 推送到远程仓库
echo    git log --oneline   - 查看提交历史
echo.
pause