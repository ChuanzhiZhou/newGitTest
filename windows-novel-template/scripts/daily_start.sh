#!/bin/bash

# 每日写作启动脚本
echo "📝 ===== 今日写作开始 ===== 📝"
echo ""
echo "📅 日期: $(date '+%Y-%m-%d %H:%M')"
echo "🌿 当前分支: $(git branch --show-current)"
echo "📊 Git状态:"
git status --porcelain | head -5

echo ""
echo "📖 项目进度查看:"
if [ -f "resources/progress_tracker.md" ]; then
    echo "   查看进度: cursor resources/progress_tracker.md"
fi

echo ""
echo "🎯 今日写作建议："
echo "   1. 回顾昨日进度和今日目标"
echo "   2. 向AI描述今日写作计划"
echo "   3. 确认要写作的章节和内容"
echo "   4. 准备相关的设定文档"

echo ""
echo "🤖 AI协助提示："
echo "   可以向AI说：'我今天计划写第X章，内容是[简述]，请帮我规划写作重点'"

echo ""
echo "💡 快速命令："
echo "   开始写作: cursor chapters/"
echo "   查看大纲: cursor outline/"
echo "   查看角色设定: cursor characters/"
echo "   查看世界观: cursor worldbuilding/"

echo ""
echo "✨ 祝你今天写作顺利！记得定期保存和提交Git ✨"
echo ""