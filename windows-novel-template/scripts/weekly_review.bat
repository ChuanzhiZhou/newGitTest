@echo off
chcp 65001 >nul

echo 📅 ===== 每周写作回顾 ===== 📅
echo.

echo 📆 回顾时间: %date%
echo.

:: Git提交统计
echo 📊 本周Git活动：
if exist .git (
    echo    查看最近提交记录...
    git log --oneline -10 2>nul
) else (
    echo    ⚠️  当前目录不是Git仓库
)

echo.
echo.

:: 互动式回顾
set /p completed_chapters="📖 本周完成了哪些章节？ "
set /p total_words="📊 本周总共写了多少字？ "
set /p highlights="💡 本周写作的亮点是什么？ "
set /p challenges="😓 本周遇到的主要困难？ "
set /p next_week_goals="🎯 下周的写作目标？ "

echo.
echo 📋 本周总结报告：
echo ====================
echo 完成章节: %completed_chapters%
echo 总写字数: %total_words%
echo 主要亮点: %highlights%
echo 遇到困难: %challenges%
echo 下周目标: %next_week_goals%
echo ====================

echo.
echo 🤖 AI协助建议：
echo    将以上总结发送给AI，可以得到：
echo    1. 写作进度分析
echo    2. 改进建议
echo    3. 下周计划优化
echo    4. 写作技巧提升建议

echo.
echo 🎊 本周写作回顾完成！继续加油！ 🎊
echo.
pause