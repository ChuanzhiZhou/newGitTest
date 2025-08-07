#!/bin/bash

# 设置小说写作脚本的别名
NOVEL_DIR="/workspace/novel"

echo "🔧 设置小说写作脚本别名..."

# 添加别名到当前会话
alias novel-start="cd $NOVEL_DIR && ./scripts/daily_start.sh"
alias novel-end="cd $NOVEL_DIR && ./scripts/daily_end.sh"
alias novel-review="cd $NOVEL_DIR && ./scripts/weekly_review.sh"
alias novel-backup="cd $NOVEL_DIR && ./scripts/auto_backup.sh"
alias novel-dir="cd $NOVEL_DIR"

echo "✅ 别名设置完成！"
echo ""
echo "现在你可以在任何位置使用："
echo "  novel-start   # 开始写作"
echo "  novel-end     # 结束写作"
echo "  novel-review  # 每周回顾"
echo "  novel-backup  # 备份项目"
echo "  novel-dir     # 切换到项目目录"
echo ""
echo "注意：别名只在当前会话有效"
echo "要永久生效，请将别名添加到 ~/.bashrc 或 ~/.zshrc"