#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
小说字数统计工具
统计章节文件的字数，跟踪写作进度
"""

import os
import re
import json
from pathlib import Path

def count_words_in_file(file_path):
    """统计单个文件的字数"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 移除Markdown标记
        content = re.sub(r'#+ ', '', content)  # 移除标题标记
        content = re.sub(r'\*\*([^*]+)\*\*', r'\1', content)  # 移除粗体标记
        content = re.sub(r'\*([^*]+)\*', r'\1', content)  # 移除斜体标记
        content = re.sub(r'`([^`]+)`', r'\1', content)  # 移除代码标记
        
        # 统计中文字符数（主要）+ 英文单词数
        chinese_chars = len(re.findall(r'[\u4e00-\u9fff]', content))
        english_words = len(re.findall(r'\b[a-zA-Z]+\b', content))
        
        return chinese_chars + english_words
    except Exception as e:
        print(f"读取文件 {file_path} 时出错: {e}")
        return 0

def get_chapter_stats():
    """获取所有章节的统计信息"""
    chapters_dir = Path('chapters')
    if not chapters_dir.exists():
        print("chapters 目录不存在")
        return {}
    
    stats = {}
    total_words = 0
    
    # 获取所有.md文件
    chapter_files = sorted(chapters_dir.glob('*.md'))
    
    for file_path in chapter_files:
        word_count = count_words_in_file(file_path)
        stats[file_path.name] = word_count
        total_words += word_count
    
    stats['total'] = total_words
    stats['chapters_count'] = len(chapter_files)
    
    return stats

def save_progress(stats):
    """保存进度到JSON文件"""
    progress_file = Path('tools/progress.json')
    
    # 如果文件存在，读取历史数据
    history = []
    if progress_file.exists():
        try:
            with open(progress_file, 'r', encoding='utf-8') as f:
                data = json.load(f)
                history = data.get('history', [])
        except:
            pass
    
    # 添加当前数据
    from datetime import datetime
    current_record = {
        'date': datetime.now().isoformat(),
        'total_words': stats['total'],
        'chapters_count': stats['chapters_count']
    }
    history.append(current_record)
    
    # 保存数据
    progress_data = {
        'current': stats,
        'history': history[-30:] if len(history) > 30 else history  # 只保留最近30条记录
    }
    
    with open(progress_file, 'w', encoding='utf-8') as f:
        json.dump(progress_data, f, ensure_ascii=False, indent=2)

def print_stats(stats):
    """打印统计结果"""
    print("="*50)
    print("📚 小说写作进度统计")
    print("="*50)
    
    if stats['chapters_count'] == 0:
        print("暂无章节文件")
        return
    
    print(f"📖 总章节数: {stats['chapters_count']}")
    print(f"✍️  总字数: {stats['total']:,} 字")
    print(f"🎯 目标字数: 100,000 字")
    
    progress = (stats['total'] / 100000) * 100
    print(f"📊 完成进度: {progress:.1f}%")
    
    if stats['chapters_count'] > 0:
        avg_words = stats['total'] / stats['chapters_count']
        print(f"📝 平均每章: {avg_words:.0f} 字")
    
    remaining = 100000 - stats['total']
    if remaining > 0:
        print(f"⏳ 剩余字数: {remaining:,} 字")
        if avg_words > 0:
            remaining_chapters = remaining / avg_words
            print(f"📋 预计剩余章节: {remaining_chapters:.0f} 章")
    
    print("\n" + "="*50)
    print("📑 各章节字数:")
    print("="*50)
    
    for filename, word_count in stats.items():
        if filename not in ['total', 'chapters_count']:
            print(f"{filename:<20} {word_count:>6,} 字")

def main():
    """主函数"""
    print("正在统计字数...")
    stats = get_chapter_stats()
    
    if stats:
        print_stats(stats)
        save_progress(stats)
        print(f"\n💾 进度已保存到 tools/progress.json")
    else:
        print("没有找到章节文件或统计失败")

if __name__ == "__main__":
    # 确保在项目根目录运行
    if not Path('chapters').exists():
        print("请在小说项目根目录运行此脚本")
        exit(1)
    
    main()