# 小说创作项目

## 项目结构

### 📁 outline/ - 大纲管理
- `main_outline.md` - 主要情节大纲
- `chapter_outline.md` - 章节详细大纲
- `plot_points.md` - 关键情节点

### 📁 characters/ - 人物设定
- `main_characters.md` - 主要角色详细设定
- `supporting_characters.md` - 配角设定
- `character_relationships.md` - 人物关系图

### 📁 worldbuilding/ - 世界观设定
- `world_overview.md` - 世界观总览
- `geography.md` - 地理环境
- `culture_society.md` - 文化社会
- `magic_system.md` - 魔法/科技体系（如适用）

### 📁 chapters/ - 正式章节
- `chapter_template.md` - 章节写作模板
- `chapter_01.md` - 第一章
- `chapter_02.md` - 第二章
- ... (按需添加)

### 📁 drafts/ - 草稿区
- `writing_workflow.md` - 写作工作流程指南
- 存放各种草稿、片段、灵感记录

### 📁 resources/ - 资源文件
- `progress_tracker.md` - 写作进度追踪
- `writing_tips.md` - 写作技巧和建议
- `ai_writing_assistant.md` - AI协助写作工作流程
- `ai_prompt_templates.md` - AI提示词模板集合

### 📁 scripts/ - 自动化脚本
- `daily_start.sh` - 每日写作启动脚本
- `daily_end.sh` - 每日写作结束脚本
- `weekly_review.sh` - 每周回顾脚本
- `auto_backup.sh` - 自动备份脚本

---

## 🚀 快速开始

### 1. 第一次使用
```bash
# 查看项目结构
ls -la

# 运行每日写作启动脚本
./scripts/daily_start.sh

# 开始填写你的设定
cursor outline/main_outline.md
cursor characters/main_characters.md
cursor worldbuilding/world_overview.md
```

### 2. 日常写作流程
```bash
# 每日开始
./scripts/daily_start.sh

# 开始写作（使用模板）
cp chapters/chapter_template.md chapters/chapter_01.md
cursor chapters/chapter_01.md

# 每日结束（自动Git提交）
./scripts/daily_end.sh
```

### 3. 定期维护
```bash
# 每周回顾
./scripts/weekly_review.sh

# 备份项目
./scripts/auto_backup.sh

# 查看进度
cursor resources/progress_tracker.md
```

---

## 🤖 AI协助写作

### 核心理念
- **AI作为助手**：提供灵感和建议，你保持创作主导权
- **结构化协作**：使用标准化提示词模板，提高效率
- **持续改进**：根据AI反馈不断完善作品质量

### 使用方式

#### 前期规划
1. 打开 `resources/ai_prompt_templates.md`
2. 使用"大纲分析与扩展"模板
3. 将AI建议整理到相应设定文档
4. 用Git提交设定更新

#### 日常写作
1. 遇到困难时使用"情节卡顿求助"模板
2. 完成章节后使用"章节质量检查"模板
3. 对话不自然时使用"对话优化"模板
4. 用AI检查逻辑和一致性

#### 修改完善
1. 使用"整体结构分析"检查全书结构
2. 使用"语言风格统一"确保文风一致
3. 定期让AI做"读者视角检查"

### AI协助流程
```
每日写作前 → 向AI描述写作计划
写作过程中 → 遇到问题即时求助AI  
写作完成后 → 让AI检查质量和逻辑
每周总结 → 与AI分析进展和改进方向
```

---

## 📊 Git版本控制

### 提交规范

#### 日常提交
```bash
# 章节写作
git add .
git commit -m "第X章：[章节标题] - 新增[字数]字"

# 设定更新
git add .  
git commit -m "更新角色设定：[具体内容]"

# 大纲调整
git add .
git commit -m "调整大纲：[调整内容]"
```

#### 里程碑提交
```bash
# 重要节点
git add .
git commit -m "里程碑：完成第一部分（第1-5章）"
git tag "第一部分完成"

# 完成初稿
git add .
git commit -m "里程碑：初稿完成 - 总计10万字"
git tag "初稿完成"
```

### 分支策略
- `main/master` - 稳定版本
- `writing` - 日常写作分支  
- `editing` - 修改分支
- `experimental` - 实验性内容

### 备份策略
- **自动备份**：运行 `./scripts/auto_backup.sh`
- **本地备份**：Git bundle + 文件夹压缩
- **远程备份**：推送到GitHub/GitLab等平台
- **定期清理**：自动保留最近10个备份

---

## 📈 进度管理

### 目标设定
- **总字数**: 约10万字
- **预计章节数**: 25-30章
- **每章字数**: 3000-5000字
- **完成时间**: 4-5个月

### 写作节奏
- **日目标**: 800-1200字
- **周目标**: 5000-7000字  
- **月目标**: 20000-25000字

### 追踪工具
- `resources/progress_tracker.md` - 详细进度记录
- Git提交历史 - 版本进展追踪
- 每日/每周脚本 - 自动化统计

---

## ✨ 写作工作流

### 推荐的每日流程

**准备阶段 (10分钟)**
1. 运行 `./scripts/daily_start.sh`
2. 回顾昨日进度和今日目标
3. 向AI描述今日写作计划
4. 准备相关设定文档

**写作阶段 (60-90分钟)**
1. 按照章节模板开始写作
2. 专注内容创作，不过度修改
3. 遇到困难时向AI求助
4. 记录灵感和问题

**检查阶段 (15分钟)**
1. 通读今日内容
2. 用AI检查逻辑和质量
3. 更新进度追踪
4. 运行 `./scripts/daily_end.sh`

### 每周维护流程
1. **周一**: 与AI规划本周重点
2. **周三**: 检查进展，调整计划
3. **周五**: 总结成果，规划下周  
4. **周日**: 运行 `./scripts/weekly_review.sh`

---

## 🛠️ 工具和技巧

### Cursor使用技巧
- **侧边栏管理**: 快速切换章节和设定
- **搜索功能**: 全局搜索角色名、地名保持一致性
- **分屏功能**: 同时查看大纲和正文
- **多文件对比**: 检查前后章节的连贯性

### 脚本使用
```bash
# 给脚本添加执行权限（首次）
chmod +x scripts/*.sh

# 每日使用
./scripts/daily_start.sh    # 开始写作
./scripts/daily_end.sh      # 结束写作

# 定期维护
./scripts/weekly_review.sh  # 每周回顾
./scripts/auto_backup.sh    # 项目备份
```

### AI协作最佳实践
1. **明确上下文**: 每次对话提供足够背景信息
2. **保存精华**: 将有价值的AI建议保存到文档
3. **批判思考**: 不盲从AI建议，保持创作主导权
4. **持续优化**: 根据使用效果调整提示词模板

---

## 📚 学习资源

### 项目内资源
- `resources/writing_tips.md` - 写作技巧大全
- `resources/ai_writing_assistant.md` - AI协作详细指南
- `resources/ai_prompt_templates.md` - 12个精选提示词模板
- `drafts/writing_workflow.md` - 详细工作流程

### 推荐外部资源
- 写作技巧书籍
- 同类型优秀小说研究
- 写作社区和论坛
- 在线写作课程

---

## 🎯 成功要素

### 关键习惯
1. **每日坚持**: 哪怕只写500字也要保持习惯
2. **定期备份**: 使用Git和脚本保护你的心血
3. **AI协作**: 充分利用AI提升创作效率和质量
4. **进度追踪**: 可视化进展增强成就感和动力

### 质量保证
1. **结构规划**: 详细大纲确保情节完整
2. **角色一致**: 人物设定表确保角色立体
3. **世界观统一**: 设定文档确保逻辑自洽
4. **持续修改**: 多轮修改打磨作品质量

---

## 🆘 常见问题

### Q: 如何开始第一章？
A: 
1. 完善 `outline/main_outline.md` 中的大纲
2. 复制 `chapters/chapter_template.md` 为 `chapter_01.md`
3. 使用AI提示词"章节规划"模板规划第一章
4. 按照模板结构开始写作

### Q: 写作卡顿怎么办？
A:
1. 使用 `resources/ai_prompt_templates.md` 中的"情节卡顿求助"
2. 回到大纲重新审视情节安排
3. 从角色动机角度思考下一步
4. 暂时跳过，先写其他部分

### Q: 如何保证角色一致性？
A:
1. 详细填写 `characters/main_characters.md`
2. 写作前回顾角色设定
3. 定期用AI检查角色行为一致性
4. 用Cursor全局搜索角色名检查前后表现

### Q: 如何备份和恢复？
A:
1. 定期运行 `./scripts/auto_backup.sh`
2. 备份保存在 `$HOME/novel_backups/`
3. 恢复时解压 `.tar.gz` 文件或使用Git bundle
4. 推荐同时使用远程Git仓库

---

## 🎉 开始你的创作之旅

这个系统为你提供了：
- ✅ 完整的项目结构
- ✅ AI协助写作工具链  
- ✅ Git版本控制系统
- ✅ 自动化脚本支持
- ✅ 进度追踪机制
- ✅ 备份安全保障

现在就开始填写你的设定，开启10万字小说的创作之旅吧！

```bash
# 开始你的第一天
./scripts/daily_start.sh
```

**记住：每一个伟大的故事都始于勇敢的第一步！** ✨
