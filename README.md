# 同济大学硕士开题报告 LaTeX 模板

本项目是一个面向同济大学硕士研究生开题报告的 XeLaTeX 模板工程，当前已经包含：

- 自定义封面页
- 选题报告说明框 `\proposalrequirement`
- 正文标题层级与字号样式
- `biblatex + biber` 参考文献
- 公式、定理、算法环境
- 研究进度表环境
- VS Code `LaTeX Workshop` 编译配置

## 项目结构

- [main.tex](/Users/tracyyu/Documents/Tongji/学硕课程/城市数据智能/28-硕士论文开题报告-Chunxian/main.tex)：主文档入口
- [tongji-thesis.cls](/Users/tracyyu/Documents/Tongji/学硕课程/城市数据智能/28-硕士论文开题报告-Chunxian/tongji-thesis.cls)：模板类文件
- [references.bib](/Users/tracyyu/Documents/Tongji/学硕课程/城市数据智能/28-硕士论文开题报告-Chunxian/references.bib)：参考文献数据库
- [figures/tongji-logo.pdf](/Users/tracyyu/Documents/Tongji/学硕课程/城市数据智能/28-硕士论文开题报告-Chunxian/figures/tongji-logo.pdf)：封面 logo
- [.vscode/settings.json](/Users/tracyyu/Documents/Tongji/学硕课程/城市数据智能/28-硕士论文开题报告-Chunxian/.vscode/settings.json)：VS Code 编译配方

## 编译方式

### VS Code

建议安装扩展：

- `James-Yu.latex-workshop`

当前项目已经配置好配方：

- `xelatex -> biber -> xelatex x2`

保存后即可自动编译；如果新增或修改了引用，建议至少完整跑一遍文献流程。

### 命令行

在项目目录下执行：

```bash
/Library/TeX/texbin/xelatex main.tex
/Library/TeX/texbin/biber main
/Library/TeX/texbin/xelatex main.tex
/Library/TeX/texbin/xelatex main.tex
```

## 主文件用法

`main.tex` 目前的基本结构如下：

```tex
\documentclass{tongji-thesis}
\usepackage[backend=biber,style=gb7714-2015]{biblatex}
\addbibresource{references.bib}

\Title{论文题目}
\StudentID{学号}
\StudentName{姓名}
\DisciplineCategory{学科门类}
\FirstDiscipline{一级学科}
\ResearchField{研究方向}
\College{所在学院}
\JointUnit{联合培养单位}
\Supervisor{指导教师}
\ProposalDate{YYYY-MM-DD}
\ProposalYear{YYYY}
\ProposalMonth{M}
\ProposalDay{D}

\begin{document}
\makeproposalcover
\proposalrequirement
...
\printbibliography
...
\end{document}
```

## 已定义的封面信息命令

- `\Title{...}`：论文题目
- `\StudentID{...}`：学号
- `\StudentName{...}`：姓名
- `\DisciplineCategory{...}`：学科门类
- `\FirstDiscipline{...}`：一级学科
- `\ResearchField{...}`：研究方向
- `\College{...}`：所在学院
- `\JointUnit{...}`：联合培养单位
- `\Supervisor{...}`：指导教师
- `\ProposalDate{...}`：选题时间，显示在封面表格中
- `\ProposalYear{...}`、`\ProposalMonth{...}`、`\ProposalDay{...}`：显示在封面底部日期

## 标题与正文样式

当前模板采用 `section` 作为一级标题，而不是 `chapter`。

- 一级标题：`\section{...}`
  - 编号样式：`1 标题`
- 二级标题：`\subsection{...}`
  - 编号样式：`1.1 标题`
- 三级标题：`\subsubsection{...}`
  - 编号样式：`1.1.1 标题`
- 段落标题：`\paragraph{...}`
  - 编号样式：`（一）标题`

正文样式：

- 正文 12pt
- 首行缩进 `2em`
- 一级、二级、三级、段落标题均为加粗

## 参考文献

模板使用：

- `biblatex`
- `biber`
- `gb7714-2015` 样式

文末输出参考文献：

```tex
\printbibliography
```

文献条目维护在 [references.bib](/Users/tracyyu/Documents/Tongji/学硕课程/城市数据智能/28-硕士论文开题报告-Chunxian/references.bib)。

## 数学公式

类文件已预加载：

- `amsmath`
- `amssymb`
- `amsfonts`
- `mathtools`
- `bm`

并定义了：

- 公式按 `section` 编号，如 `1-1`
- `\diff`、`\ee`、`\ii`
- `\R`、`\N`
- `\vect{...}`、`\mat{...}`

示例：

```tex
\begin{align}
  L &= L_{\mathrm{seg}} + \lambda L_{\mathrm{reg}} \\
    &= -\sum_i y_i \log \hat{y}_i + \lambda \|\theta\|_2^2
\end{align}
```

## 定理环境

已定义：

- `definition`
- `example`
- `theorem`
- `lemma`
- `proposition`
- `corollary`
- `remark`

均按 `section` 编号。

## 算法环境

已预加载：

- `algorithm`
- `algpseudocode`

特性：

- 算法标题中文化为“算法”
- 输入输出关键字已中文化
- 算法编号按 `section` 编号，如 `1-1`

示例：

```tex
\begin{algorithm}[htbp]
\caption{模型训练流程}
\begin{algorithmic}[1]
\Require 训练集 $D$
\Ensure 模型参数 $\theta$
\State 初始化模型参数
\end{algorithmic}
\end{algorithm}
```

## 研究进度表

模板提供：

- `researchprogresstable` 环境
- `\progressdate{开始}{结束}` 命令

示例：

```tex
\begin{researchprogresstable}
\progressdate{2025.03}{2025.04} & 查阅文献，完成研究背景分析。 & 完成文献综述。 \\
\progressdate{2025.05}{2025.06} & 设计研究方案。 & 完成总体方案设计。 \\
\end{researchprogresstable}
```

## 封面与说明页

当前封面由 `\makeproposalcover` 生成，包含：

- logo
- “攻读学术学位硕士研究生”
- “选题报告及论文工作计划”
- 基本信息表
- “同济大学研究生院”与日期

`proposalrequirement` 用于生成选题报告要求说明框及下方标题：

```tex
\proposalrequirement
```

## 常见修改入口

如果要调整封面排版，修改：

- [tongji-thesis.cls](/Users/tracyyu/Documents/Tongji/学硕课程/城市数据智能/28-硕士论文开题报告-Chunxian/tongji-thesis.cls) 中的 `\makeproposalcover`
- `\coverlabelwidth`
- `\covervaluewidth`
- `\coveritem`

如果要调整标题字号和层级样式，修改：

- `\ctexset{ ... }`

如果要调整研究进度表样式，修改：

- `researchprogresstable` 环境定义
