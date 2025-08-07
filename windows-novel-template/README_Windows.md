# 小说创作项目 (Windows版)

## 🎉 欢迎使用Windows小说写作系统！

这是一个专为Windows用户设计的10万字小说创作系统，结合AI协助和Git版本控制，让你的写作更加高效和有组织。

---

## 📁 项目结构

```
C:\Novel\my-novel\          <- 你的项目根目录
├── scripts\                <- Windows批处理脚本
│   ├── setup_git.bat       <- Git初始化设置
│   ├── daily_start.bat     <- 每日写作开始
│   ├── daily_end.bat       <- 每日写作结束
│   ├── weekly_review.bat   <- 每周回顾
│   └── auto_backup.bat     <- 自动备份
├── outline\                <- 大纲管理
│   ├── main_outline.md     <- 主要情节大纲
│   └── chapter_outline.md  <- 章节详细大纲
├── characters\             <- 人物设定
│   ├── main_characters.md  <- 主要角色设定
│   ├── supporting_characters.md <- 配角设定
│   └── character_relationships.md <- 人物关系图
├── worldbuilding\          <- 世界观设定
│   ├── world_overview.md   <- 世界观总览
│   ├── geography.md        <- 地理环境
│   └── culture_society.md  <- 文化社会
├── chapters\               <- 正式章节
│   ├── chapter_template.md <- 章节模板
│   ├── chapter_01.md       <- 第一章
│   └── ...                 <- 更多章节
├── drafts\                 <- 草稿区
│   └── writing_workflow.md <- 写作流程指南
└── resources\              <- 资源文件
    ├── progress_tracker.md <- 进度追踪
    ├── writing_tips.md     <- 写作技巧
    ├── ai_writing_assistant.md <- AI协助指南
    └── ai_prompt_templates.md <- AI提示词模板
```

---

## 🚀 快速开始

### 1. 首次设置

#### 步骤1: 复制项目文件
1. 将所有文件复制到 `C:\Novel\my-novel\` 目录
2. 确保所有 `.bat` 文件都在 `scripts\` 文件夹内

#### 步骤2: 设置Git
```cmd
# 在项目目录下打开命令提示符
cd C:\Novel\my-novel

# 运行Git设置脚本
scripts\setup_git.bat
```

#### 步骤3: 开始第一天写作
```cmd
# 运行每日开始脚本
scripts\daily_start.bat
```

### 2. 验证安装

打开命令提示符，切换到项目目录，运行：
```cmd
cd C:\Novel\my-novel
dir scripts\*.bat
```

应该看到以下文件：
- ✅ setup_git.bat
- ✅ daily_start.bat  
- ✅ daily_end.bat
- ✅ weekly_review.bat
- ✅ auto_backup.bat

---

## 📝 日常使用流程

### 每日写作流程

#### 1. 开始写作
```cmd
# 方法1: 双击运行
双击 scripts\daily_start.bat

# 方法2: 命令行运行  
cd C:\Novel\my-novel
scripts\daily_start.bat
```

#### 2. 写作过程
1. 使用Cursor编辑器打开章节文件
2. 参考 `resources\ai_prompt_templates.md` 获得AI协助
3. 遇到困难时向AI求助

#### 3. 结束写作
```cmd
# 运行结束脚本（自动Git提交）
scripts\daily_end.bat
```

### 定期维护

#### 每周回顾
```cmd
scripts\weekly_review.bat
```

#### 项目备份
```cmd
scripts\auto_backup.bat
```

---

## 🤖 AI协助写作

### 核心理念
- **AI是助手**：提供建议和灵感，你保持创作主导权
- **模板化交互**：使用标准提示词模板提高效率
- **持续改进**：根据AI反馈优化作品质量

### 使用方式

#### 1. 打开AI提示词模板
```cmd
cursor resources\ai_prompt_templates.md
```

#### 2. 选择合适的模板
- **前期规划**：大纲分析、角色发展、世界观构建
- **日常写作**：章节规划、对话优化、场景描写、情节卡顿求助
- **修改完善**：章节质量检查、整体结构分析、语言风格统一

#### 3. 向AI提问
复制模板，替换方括号内容为你的具体信息，然后向AI提问

#### 4. 整理AI建议
将有价值的建议保存到相应的设定文档中

### AI协助示例

**情况：第一章写作卡顿**
```
我正在写第1章，当前情况是：主角刚到达新学校，但不知道下一步该做什么

我的问题：不知道角色下一步该做什么

角色设定：李明，17岁高中生，内向但聪明
故事目标：介绍学校环境，遇到重要配角

请提供3-5个具体的解决建议，要求符合角色性格和故事逻辑。
```

---

## 📊 Git版本控制

### 基本使用

#### 查看状态
```cmd
git status
```

#### 手动提交
```cmd
git add .
git commit -m "第1章：新的开始 - 新增3000字"
```

#### 查看历史
```cmd
git log --oneline
```

### 提交规范

#### 日常提交
```cmd
git commit -m "第X章：[章节标题] - 新增[字数]字"
git commit -m "更新角色设定：[具体内容]"
git commit -m "调整大纲：[调整内容]"
```

#### 里程碑提交
```cmd
git commit -m "里程碑：完成第一部分（第1-5章）"
git tag "第一部分完成"
```

### 远程仓库设置

如果要同步到GitHub等平台：

```cmd
# 添加远程仓库
git remote add origin https://github.com/用户名/仓库名.git

# 推送到远程
git push -u origin main
```

---

## 🔧 常见问题解决

### Q1: 双击.bat文件闪退？
**解决方案**: 在命令提示符中运行，查看错误信息
```cmd
cd C:\Novel\my-novel
scripts\daily_start.bat
```

### Q2: Git命令不识别？
**解决方案**: 安装Git for Windows
1. 下载：https://git-scm.com/download/win
2. 安装后重启命令提示符
3. 运行 `scripts\setup_git.bat`

### Q3: 中文显示乱码？
**解决方案**: 
- 确保命令提示符支持UTF-8编码
- 脚本开头已加入 `chcp 65001` 命令

### Q4: 备份失败？
**解决方案**: 
- 安装7-Zip：https://www.7-zip.org/
- 或确保Windows PowerShell可用

### Q5: 找不到Cursor？
**解决方案**: 
- 安装Cursor编辑器：https://cursor.sh/
- 或修改脚本中的 `cursor` 为你使用的编辑器命令

---

## 🛠️ 系统要求

### 必需软件
- ✅ **Windows 10/11**
- ✅ **Git for Windows** - 版本控制
- ✅ **文本编辑器** - 推荐Cursor

### 推荐软件
- 🔹 **7-Zip** - 备份压缩
- 🔹 **Windows Terminal** - 更好的命令行体验
- 🔹 **PowerShell** - 高级脚本功能

### 文件夹权限
确保对 `C:\Novel\my-novel\` 目录有完整读写权限

---

## 📈 进度目标

### 总体目标
- **总字数**: 100,000字
- **章节数**: 25-30章
- **完成时间**: 4-5个月

### 日常目标  
- **日产量**: 800-1200字
- **周产量**: 5000-7000字
- **月产量**: 20000-25000字

### 里程碑
- [ ] **第1万字** - 熟悉系统
- [ ] **第2万字** - 完成第一部分
- [ ] **第5万字** - 故事过半  
- [ ] **第8万字** - 准备高潮
- [ ] **第10万字** - 初稿完成

---

## 🎯 高效使用技巧

### 1. 创建桌面快捷方式
右键 → 发送到 → 桌面快捷方式：
- `scripts\daily_start.bat`
- `scripts\daily_end.bat`

### 2. 自定义Windows Terminal配置
添加配置文件快速启动到项目目录

### 3. 设置定时提醒
使用Windows任务计划程序设置：
- 每日写作提醒
- 每周备份提醒

### 4. 批量操作
```cmd
# 快速复制章节模板
copy chapters\chapter_template.md chapters\chapter_05.md

# 快速查看所有章节
dir chapters\*.md
```

---

## 📚 学习资源

### 项目内资源
- 📖 `resources\writing_tips.md` - 写作技巧大全
- 🤖 `resources\ai_writing_assistant.md` - AI协作详细指南  
- 📝 `resources\ai_prompt_templates.md` - 12个AI提示词模板
- 📊 `resources\progress_tracker.md` - 进度追踪表

### 推荐外部资源
- 💻 [Cursor官网](https://cursor.sh/) - AI代码编辑器
- 🔧 [Git教程](https://git-scm.com/book/zh/v2) - Git使用指南
- 📝 写作社区和论坛
- 📚 写作技巧相关书籍

---

## 🎉 开始你的创作之旅

### 立即行动清单

1. **✅ 复制所有文件到** `C:\Novel\my-novel\`
2. **✅ 运行** `scripts\setup_git.bat` **设置Git**
3. **✅ 填写** `outline\main_outline.md` **的大纲**
4. **✅ 完善** `characters\main_characters.md` **的角色**
5. **✅ 运行** `scripts\daily_start.bat` **开始第一天**

### 第一天建议

```cmd
# 1. 启动系统
scripts\daily_start.bat

# 2. 向AI咨询大纲
使用"大纲分析与扩展"模板

# 3. 完善设定文档
cursor outline\main_outline.md
cursor characters\main_characters.md

# 4. 开始第一章
copy chapters\chapter_template.md chapters\chapter_01.md
cursor chapters\chapter_01.md

# 5. 结束第一天
scripts\daily_end.bat
```

---

## 💡 成功秘诀

### 关键习惯
1. **每日坚持** - 哪怕只写500字
2. **定期备份** - 每周运行 `auto_backup.bat`
3. **AI协作** - 充分利用提示词模板
4. **进度追踪** - 定期更新 `progress_tracker.md`

### 写作心态
- 📝 **先完成，再完美** - 初稿重在完成
- 🤖 **AI是助手** - 保持创作主导权
- 📊 **数据驱动** - 用统计数据激励自己
- 🎯 **小目标** - 分解大目标为可达成的小步骤

---

**🌟 每一个伟大的故事都始于勇敢的第一步！现在就开始你的10万字小说创作之旅吧！🌟**

```cmd
cd C:\Novel\my-novel
scripts\daily_start.bat
```

**祝你写作愉快！** ✨📚🚀
