#!/bin/bash

# 自动备份脚本
BACKUP_DIR="$HOME/novel_backups"
PROJECT_DIR="/workspace/novel"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="novel_backup_$DATE"

echo "🔄 ===== 小说项目自动备份 ===== 🔄"
echo ""

# 创建备份目录
mkdir -p "$BACKUP_DIR"

echo "📁 备份目录: $BACKUP_DIR"
echo "📅 备份时间: $(date)"
echo ""

# 切换到项目目录
cd "$PROJECT_DIR" || exit

# 检查Git状态
if [ -n "$(git status --porcelain)" ]; then
    echo "⚠️  检测到未提交的更改，建议先提交到Git"
    echo "未提交的文件:"
    git status --porcelain
    echo ""
    read -p "是否继续备份? (y/n): " continue_backup
    if [ "$continue_backup" != "y" ]; then
        echo "❌ 备份已取消"
        exit 1
    fi
fi

# 创建Git备份
echo "📦 创建Git版本备份..."
git bundle create "$BACKUP_DIR/${BACKUP_NAME}.bundle" --all
echo "✅ Git备份完成: ${BACKUP_NAME}.bundle"

# 创建文件夹备份
echo "📂 创建文件夹备份..."
tar -czf "$BACKUP_DIR/${BACKUP_NAME}.tar.gz" -C "$(dirname "$PROJECT_DIR")" "$(basename "$PROJECT_DIR")"
echo "✅ 文件夹备份完成: ${BACKUP_NAME}.tar.gz"

# 生成备份信息
cat > "$BACKUP_DIR/${BACKUP_NAME}_info.txt" << EOF
备份信息
=======
备份时间: $(date)
项目路径: $PROJECT_DIR
Git分支: $(git branch --show-current)
最近提交: $(git log -1 --pretty=format:"%h - %s (%cr)")
文件数量: $(find . -name "*.md" | wc -l) 个Markdown文件
项目大小: $(du -sh . | cut -f1)

文件列表:
$(find . -name "*.md" -type f | sort)

最近5次提交:
$(git log --oneline -5)
EOF

echo "📝 备份信息已生成: ${BACKUP_NAME}_info.txt"

# 清理旧备份（保留最近10个）
echo ""
echo "🧹 清理旧备份文件..."
cd "$BACKUP_DIR"
ls -t novel_backup_*.bundle 2>/dev/null | tail -n +11 | xargs rm -f
ls -t novel_backup_*.tar.gz 2>/dev/null | tail -n +11 | xargs rm -f
ls -t novel_backup_*_info.txt 2>/dev/null | tail -n +11 | xargs rm -f

# 显示备份统计
echo "📊 备份统计:"
echo "   当前备份数量: $(ls novel_backup_*.bundle 2>/dev/null | wc -l)"
echo "   备份总大小: $(du -sh . | cut -f1)"
echo "   最新备份: $BACKUP_NAME"

echo ""
echo "✨ 备份完成！备份文件保存在: $BACKUP_DIR ✨"

# 可选：推送到远程仓库
read -p "🌐 是否推送到远程Git仓库? (y/n): " push_remote
if [ "$push_remote" = "y" ]; then
    cd "$PROJECT_DIR"
    if git remote -v | grep -q origin; then
        echo "📤 推送到远程仓库..."
        git push origin --all
        git push origin --tags
        echo "✅ 远程推送完成"
    else
        echo "⚠️  未找到远程仓库配置"
    fi
fi

echo ""
echo "🎉 备份流程全部完成！ 🎉"