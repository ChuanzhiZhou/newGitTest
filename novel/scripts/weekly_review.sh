#!/bin/bash

# 每周回顾脚本
echo "📅 ===== 每周写作回顾 ===== 📅"
echo ""

week_start=$(date -d "last monday" '+%Y-%m-%d')
week_end=$(date -d "next sunday" '+%Y-%m-%d')

echo "📆 回顾时间段: $week_start 到 $week_end"
echo ""

# Git提交统计
echo "📊 本周Git活动："
commits_this_week=$(git log --since="$week_start" --until="$week_end" --oneline | wc -l)
echo "   本周提交次数: $commits_this_week"

if [ $commits_this_week -gt 0 ]; then
    echo ""
    echo "📝 本周提交记录："
    git log --since="$week_start" --until="$week_end" --pretty=format:"   %h - %s (%cr)" --no-merges | head -10
fi

echo ""
echo ""

# 文件变化统计
echo "📁 本周文件变化："
changed_files=$(git diff --name-only HEAD~$commits_this_week HEAD 2>/dev/null | wc -l)
echo "   修改文件数: $changed_files"

echo ""

# 互动式回顾
read -p "📖 本周完成了哪些章节？ " completed_chapters
read -p "📊 本周总共写了多少字？ " total_words
read -p "💡 本周写作的亮点是什么？ " highlights
read -p "😓 本周遇到的主要困难？ " challenges
read -p "🎯 下周的写作目标？ " next_week_goals

echo ""
echo "📋 本周总结报告："
echo "===================="
echo "完成章节: $completed_chapters"
echo "总写字数: $total_words"
echo "主要亮点: $highlights"
echo "遇到困难: $challenges"
echo "下周目标: $next_week_goals"
echo "===================="

echo ""
echo "🤖 AI协助建议："
echo "   将以上总结发送给AI，可以得到："
echo "   1. 写作进度分析"
echo "   2. 改进建议"
echo "   3. 下周计划优化"
echo "   4. 写作技巧提升建议"

echo ""
echo "🎊 本周写作回顾完成！继续加油！ 🎊"
echo ""