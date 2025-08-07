#!/bin/bash

# 每日写作结束脚本
echo "🎉 ===== 今日写作结束 ===== 🎉"
echo ""

# 获取用户输入
read -p "📖 请输入今日完成的章节 (如: 第1章): " chapter
read -p "📊 请输入今日新增字数: " wordcount
read -p "💭 请简述今日写作内容: " content_summary

# 检查是否有未保存的更改
if [ -n "$(git status --porcelain)" ]; then
    echo ""
    echo "📁 检测到新的更改，正在提交到Git..."
    
    # 提交到Git
    git add .
    
    if [ -n "$chapter" ] && [ -n "$wordcount" ]; then
        commit_msg="${chapter}：${content_summary} - 新增${wordcount}字 [$(date +%Y-%m-%d)]"
    else
        commit_msg="日常写作进度更新 [$(date +%Y-%m-%d)]"
    fi
    
    git commit -m "$commit_msg"
    
    echo "✅ Git提交完成: $commit_msg"
else
    echo "📁 没有检测到新的更改"
fi

echo ""
echo "📈 今日成果总结："
echo "   章节: $chapter"
echo "   字数: $wordcount"
echo "   内容: $content_summary"

echo ""
echo "🤖 AI协助建议："
echo "   可以向AI说：'我今天完成了$chapter，写了$wordcount字，内容是：$content_summary'"
echo "   请AI帮你："
echo "   1. 检查今日内容的逻辑性"
echo "   2. 提供改进建议"
echo "   3. 规划明日写作重点"

echo ""
echo "📝 明日准备："
read -p "🎯 请输入明日写作计划: " tomorrow_plan
echo "   明日目标已记录: $tomorrow_plan"

echo ""
echo "🎊 今日写作辛苦了！记得休息和总结 🎊"
echo ""

# 显示项目整体进度
echo "📊 项目整体统计："
total_files=$(find chapters/ -name "*.md" -not -name "chapter_template.md" | wc -l)
echo "   已创建章节文件: $total_files"

total_commits=$(git rev-list --count HEAD)
echo "   Git提交次数: $total_commits"

echo ""