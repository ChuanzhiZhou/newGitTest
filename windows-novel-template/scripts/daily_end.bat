@echo off
chcp 65001 >nul

echo 🎉 ===== 今日写作结束 ===== 🎉
echo.

:: 获取用户输入
set /p chapter="📖 请输入今日完成的章节 (如: 第1章): "
set /p wordcount="📊 请输入今日新增字数: "
set /p content_summary="💭 请简述今日写作内容: "

:: 检查是否有未保存的更改
git status --porcelain >nul 2>&1
if %errorlevel% equ 0 (
    git status --porcelain | findstr /r "." >nul
    if not errorlevel 1 (
        echo.
        echo 📁 检测到新的更改，正在提交到Git...
        
        :: 提交到Git
        git add .
        
        if defined chapter if defined wordcount (
            git commit -m "%chapter%：%content_summary% - 新增%wordcount%字 [%date%]"
        ) else (
            git commit -m "日常写作进度更新 [%date%]"
        )
        
        echo ✅ Git提交完成
    ) else (
        echo 📁 没有检测到新的更改
    )
) else (
    echo ⚠️  当前目录不是Git仓库
)

echo.
echo 📈 今日成果总结：
echo    章节: %chapter%
echo    字数: %wordcount%
echo    内容: %content_summary%

echo.
echo 🤖 AI协助建议：
echo    可以向AI说：'我今天完成了%chapter%，写了%wordcount%字，内容是：%content_summary%'
echo    请AI帮你：
echo    1. 检查今日内容的逻辑性
echo    2. 提供改进建议
echo    3. 规划明日写作重点

echo.
set /p tomorrow_plan="🎯 请输入明日写作计划: "
echo    明日目标已记录: %tomorrow_plan%

echo.
echo 🎊 今日写作辛苦了！记得休息和总结 🎊
echo.

:: 显示项目整体进度
echo 📊 项目整体统计：
if exist chapters\ (
    dir /b chapters\*.md 2>nul | find /c /v "" > temp_count.txt
    set /p file_count=<temp_count.txt
    del temp_count.txt
    echo    已创建章节文件: %file_count%
)

git rev-list --count HEAD >temp_commits.txt 2>nul
if not errorlevel 1 (
    set /p commit_count=<temp_commits.txt
    del temp_commits.txt
    echo    Git提交次数: %commit_count%
)

echo.
pause