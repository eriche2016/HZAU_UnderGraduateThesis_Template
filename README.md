# 华中农业大学学士学位论文 LaTeX 模板

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

对照《华中农业大学学位（毕业）论文撰写规范》（自然科学类）制作的 LaTeX 模板，修复了上游模板中的多处格式问题。

> 上游模板：[eriche2016/HZAU_UnderGraduateThesis_Template](https://github.com/eriche2016/HZAU_UnderGraduateThesis_Template)，本仓库在其基础上做了规范性修正。

---

## 快速开始

**推荐使用 XeLaTeX 编译**（Overleaf 请选择 XeLaTeX 引擎）。

```bash
# 使用 latexmk 一键编译
latexmk -xelatex main.tex
```

或在 Overleaf 直接上传整个文件夹，设置编译器为 XeLaTeX。

---

## 文件结构

```
hzau-thesis-template/
├── HZAU.cls          ← 文档类（页边距、字体、标题、图表格式等）
├── main.tex          ← 主文件（填写个人信息、章节组织）
├── references.bib    ← 参考文献数据库
├── latexmkrc         ← latexmk 编译配置
├── Fig/
│   └── HZAU.png     ← 校徽（封面用）
└── chapters/
    ├── chapter1.tex  ← 各章节正文
    ├── chapter2.tex
    └── ...
```

---

## 使用说明

在 `main.tex` 顶部填写个人信息：

```latex
\newcommand{\thesisTitleC}{你的论文中文题目}
\newcommand{\thesisTitleE}{Your Thesis Title in English}
\newcommand{\yourName}{姓名}
\newcommand{\yourMajor}{专业}
\newcommand{\yourMentor}{导师姓名}
\newcommand{\Mentorjob}{职称}
\newcommand{\gradYearNum}{2025}   % 届次年份（用于偶数页页眉）
```

签名图片请自行准备，放置于 `Fig/` 目录：
- `Fig/author_signature.png`
- `Fig/mentor_signature.png`

---

## 与规范的对应关系

| 规范要求 | 实现方式 |
|---------|---------|
| 上边距/下边距 25 mm，装订边 32 mm，非装订边 25 mm | `geometry` 包设置 |
| 页眉距顶边 20 mm，页脚距底边 15 mm | `headheight=1.5cm, headsep=0.5cm, footskip=10mm` |
| 奇数页页眉=论文题目，偶数页页眉=学校+届次 | `\fancyhead[CO]` / `\fancyhead[CE]` |
| 目录在摘要之前 | `\contentpage` 置于 `abstract` 环境之前 |
| 目录页码：大写罗马（Ⅰ Ⅱ Ⅲ） | `coverpage` 设置 `\pagenumbering{Roman}` |
| 摘要页码：小写罗马（ⅰ ⅱ ⅲ） | `abstract` 环境内切换 `\pagenumbering{roman}` |
| 正文起：阿拉伯数字 | 正文前 `\pagenumbering{arabic}` |
| 正文宋体小四，英文 Times New Roman | `zihao=-4`，`\setmainfont{Times New Roman}` |
| 图题/表题比正文小一号（五号） | `\captionfont` 统一设置 `\zihao{5}` |
| 三线表 | `booktabs` 包 |
| 作者-年份引用格式 | `biblatex gb7714-2015ay` |

---

## 相比上游的修复项

| # | 问题 | 严重度 |
|---|------|--------|
| 1 | 摘要/目录顺序颠倒（摘要本应在目录之后） | 🔴 严重 |
| 2 | 奇偶页页眉未区分（均显示机构名） | 🔴 严重 |
| 3 | 页码方案：摘要用大写罗马，目录用阿拉伯（应对调且摘要改小写） | 🔴 严重 |
| 4 | 缺少 `twoside` 选项 | 🟠 中等 |
| 5 | 脚注 `\fontsize{9}{1}` 笔误（应为 `{9}{11}`，否则行间距 1pt 重叠） | 🟠 中等 |
| 6 | 页脚距底边约 7.5 mm（规范 15 mm） | 🟠 中等 |
| 7 | 图题用 `font=small`，表题用 `\zihao{5}`，不一致 | 🟡 轻微 |
| 8 | 行距 `.cls`=1.5 与 `main.tex` 覆写为 1.53 不一致 | 🟡 轻微 |
| 9 | 首行缩进覆写为固定 1.02 cm（约 2.4 字符，应为精确 2\ccwd） | 🟡 轻微 |
| 10 | 图表按章节编号（图 1-1），规范示例为连续编号（图 1） | 🟡 轻微 |
| 11 | `headsep` 被二次覆写，页眉底边从 20 mm 变 19 mm | 🟡 轻微 |

---

## License

MIT
