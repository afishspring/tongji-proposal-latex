\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tongji-thesis}[2026/05/18 Tongji master thesis proposal class]

\LoadClass[12pt,a4paper,fontset=none]{ctexart}

% 页面设置
\RequirePackage{geometry}
\geometry{
  a4paper,
  left=3.17cm,
  right=3.17cm,
  top=2.5cm,
  bottom=2.5cm
}

% 常用宏包
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{xparse}
\RequirePackage{fontspec}
\RequirePackage{indentfirst}

% =========================
% 中文字体设置
% =========================

% 默认回退字体
\newcommand{\thesismainfontname}{Songti SC}
\newcommand{\thesismainboldfontname}{STHeiti}
\newcommand{\thesissansfontname}{PingFang SC}
\newcommand{\thesissansboldfontname}{PingFang SC}

% 正文字体优先级：Songti SC -> SimSun -> STSong -> FandolSong-Regular
\IfFontExistsTF{Songti SC}{
  \renewcommand{\thesismainfontname}{Songti SC}
  \IfFontExistsTF{STHeiti}{
    \renewcommand{\thesismainboldfontname}{STHeiti}
  }
}{
  \IfFontExistsTF{SimSun}{
    \renewcommand{\thesismainfontname}{SimSun}
    \IfFontExistsTF{SimHei}{
      \renewcommand{\thesismainboldfontname}{SimHei}
    }
  }{
    \IfFontExistsTF{STSong}{
      \renewcommand{\thesismainfontname}{STSong}
      \IfFontExistsTF{STHeiti}{
        \renewcommand{\thesismainboldfontname}{STHeiti}
      }
    }{
      \renewcommand{\thesismainfontname}{FandolSong-Regular}
      \renewcommand{\thesismainboldfontname}{FandolHei-Regular}
    }
  }
}

% 黑体优先级：PingFang SC -> Heiti SC -> STHeiti -> FandolHei-Regular
\IfFontExistsTF{PingFang SC}{
  \renewcommand{\thesissansfontname}{PingFang SC}
  \IfFontExistsTF{PingFang SC Semibold}{
    \renewcommand{\thesissansboldfontname}{PingFang SC Semibold}
  }{
    \renewcommand{\thesissansboldfontname}{PingFang SC}
  }
}{
  \IfFontExistsTF{Heiti SC}{
    \renewcommand{\thesissansfontname}{Heiti SC}
    \renewcommand{\thesissansboldfontname}{Heiti SC}
  }{
    \IfFontExistsTF{STHeiti}{
      \renewcommand{\thesissansfontname}{STHeiti}
      \renewcommand{\thesissansboldfontname}{STHeiti}
    }{
      \renewcommand{\thesissansfontname}{FandolHei-Regular}
      \renewcommand{\thesissansboldfontname}{FandolHei-Regular}
    }
  }
}

% 正文中文字体：宋体
\setCJKmainfont{\thesismainfontname}[
  BoldFont = {\thesismainboldfontname}
]

% 无衬线中文字体：黑体
\setCJKsansfont{\thesissansfontname}[
  BoldFont = {\thesissansboldfontname}
]

% 方便调用
\newCJKfontfamily\thesissong{\thesismainfontname}[
  BoldFont = {\thesismainboldfontname}
]
\newCJKfontfamily\thesishei{\thesissansfontname}[
  BoldFont = {\thesissansboldfontname}
]

% 正文版式
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\renewcommand{\normalsize}{\fontsize{12pt}{18pt}\selectfont}
\normalsize

% 标题版式
\setcounter{secnumdepth}{4}
\ctexset{
  section = {
    format = \raggedright\thesishei\bfseries\fontsize{15.77pt}{22pt}\selectfont,
    aftername = \hspace{0.5em},
    beforeskip = 18pt,
    afterskip = 18pt
  },
  subsection = {
    format = \raggedright\thesishei\bfseries\fontsize{13.55pt}{20pt}\selectfont,
    aftername = \hspace{0.5em},
    beforeskip = 12pt,
    afterskip = 12pt
  },
  subsubsection = {
    format = \raggedright\thesishei\bfseries\fontsize{12pt}{18pt}\selectfont,
    aftername = \hspace{0.5em},
    beforeskip = 10pt,
    afterskip = 10pt
  },
  paragraph = {
    runin = false,
    format = \raggedright\thesishei\fontsize{12pt}{18pt}\selectfont,
    number = \theparagraph,
    aftername = \hspace{0.5em},
    beforeskip = 10pt,
    afterskip = 10pt
  }
}

\renewcommand{\theparagraph}{（\chinese{paragraph}）}


% 去掉页眉页脚
\pagestyle{plain}
\raggedbottom

% ===== 信息变量 =====
\newcommand{\thesistitle}{}
\newcommand{\studentid}{}
\newcommand{\studentname}{}
\newcommand{\disciplinecategory}{}
\newcommand{\firstdiscipline}{}
\newcommand{\researchfield}{}
\newcommand{\college}{}
\newcommand{\jointunit}{}
\newcommand{\supervisor}{}
\newcommand{\proposaldate}{}
\newcommand{\proposalyear}{}
\newcommand{\proposalmonth}{}
\newcommand{\proposalday}{}

\newcommand{\Title}[1]{\renewcommand{\thesistitle}{#1}}
\newcommand{\StudentID}[1]{\renewcommand{\studentid}{#1}}
\newcommand{\StudentName}[1]{\renewcommand{\studentname}{#1}}
\newcommand{\DisciplineCategory}[1]{\renewcommand{\disciplinecategory}{#1}}
\newcommand{\FirstDiscipline}[1]{\renewcommand{\firstdiscipline}{#1}}
\newcommand{\ResearchField}[1]{\renewcommand{\researchfield}{#1}}
\newcommand{\College}[1]{\renewcommand{\college}{#1}}
\newcommand{\JointUnit}[1]{\renewcommand{\jointunit}{#1}}
\newcommand{\Supervisor}[1]{\renewcommand{\supervisor}{#1}}
\newcommand{\ProposalDate}[1]{\renewcommand{\proposaldate}{#1}}
\newcommand{\ProposalYear}[1]{\renewcommand{\proposalyear}{#1}}
\newcommand{\ProposalMonth}[1]{\renewcommand{\proposalmonth}{#1}}
\newcommand{\ProposalDay}[1]{\renewcommand{\proposalday}{#1}}

% ===== 封面条目 =====
\newlength{\coverlabelwidth}
\newlength{\covervaluewidth}
\setlength{\coverlabelwidth}{7em}
\setlength{\covervaluewidth}{\dimexpr\textwidth-\coverlabelwidth-2\tabcolsep\relax}
% \setlength{\covervaluewidth}{27em}
\newcommand{\coverlabel}[1]{
  \makebox[\coverlabelwidth][s]{{\thesishei\bfseries\fontsize{14pt}{18pt}\selectfont #1}}
}
\newcommand{\coveritem}[2]{%
  \parbox[t]{\coverlabelwidth}{\coverlabel{#1}\par} &
  \parbox[t]{\covervaluewidth}{\centering{\thesishei\bfseries\fontsize{14pt}{18pt}\selectfont #2}\par} \\[-0.22cm]
  & \rule{\covervaluewidth}{0.4pt} \\
}

% ===== 封面 =====
\newcommand{\makeproposalcover}{%
\begin{titlepage}
\thispagestyle{empty}
\centering
\vspace*{-3cm}
\includegraphics[width=9.5cm]{figures/tongji-logo.pdf}\\[-1.5cm]
{{\thesishei\bfseries\fontsize{30pt}{34pt}\selectfont 攻读学术学位硕士研究生}}\\[0.45cm]
{{\thesishei\bfseries\fontsize{20pt}{24pt}\selectfont 选题报告及论文工作计划}}\\

\vfill

\begin{center}
\renewcommand{\arraystretch}{1.0}
\begin{tabular}{@{}p{\coverlabelwidth}@{\hspace{\tabcolsep}}p{\covervaluewidth}@{}}
\coveritem{论文题目}{\thesistitle}
\coveritem{学号}{\studentid}
\coveritem{姓名}{\studentname}
\coveritem{学科门类}{\disciplinecategory}
\coveritem{一级学科}{\firstdiscipline}
\coveritem{研究方向}{\researchfield}
\coveritem{所在学院}{\college}
\coveritem{联合培养单位}{\jointunit}
\coveritem{指导教师}{\supervisor}
\coveritem{选题时间}{\proposaldate}
\end{tabular}
\end{center}

\vfill

{{\thesishei\bfseries\fontsize{12pt}{12pt}\selectfont 同济大学研究生院}}\\
{{\thesishei\bfseries\fontsize{12pt}{12pt}\selectfont \proposalyear\ 年 \proposalmonth\ 月 \proposalday\ 日}}

\end{titlepage}
}

% 选题报告说明框
\newcommand{\proposalrequirement}{%
  \par\vspace{0.6cm}%
  \begingroup
  \thesissong
  \fontsize{12pt}{12pt}\selectfont

  % 左上角标题
  \noindent{\thesishei\bfseries 选题报告及论文工作计划要求：}\par
  \vspace{0.05cm}

  % 边框设置
  \setlength{\fboxsep}{10pt}% 边框内边距
  \setlength{\fboxrule}{1.2pt}% 边框粗细

  % 说明框
  \noindent
  \fbox{%
    \parbox{\dimexpr\textwidth-2\fboxsep-2\fboxrule\relax}{%
      1. 查阅一定数量（一般不少于30篇）的文献资料，写出论文选题书面报告，内容一般在4000字以上；\par
      \vspace{0.25em}

      2. 书面报告内容应包括：研究背景及选题依据，国内外研究现状（附参考文献目录），研究内容，研究方案，技术路线，关键创新点，研究进度安排，研究基础与可行性分析，预期成果等；\par
      \vspace{0.25em}

      3. 报告及论文工作计划应具有正确的政治立场，符合学术规范。\par
      \vspace{0.25em}

      4. 《选题报告及论文工作计划》撰写完毕后，以“学号姓名”命名，转成PDF版本后在1系统（1.tongji.edu.cn）论文选题申请时上传。%
    }%
  }%

  % 下方居中标题
  \begin{center}
    {\thesishei\bfseries\fontsize{18pt}{20pt}\selectfont 选题报告及论文工作计划}
  \end{center}

  \endgroup
}

% =========================
% 表格设置
% =========================
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{booktabs}

% 默认表格字号
\newcommand{\thesistablefont}{%
  \thesissong\fontsize{12pt}{18pt}\selectfont
}

% 默认三线表线宽
\setlength{\heavyrulewidth}{1.2pt}
\setlength{\lightrulewidth}{0.6pt}
\setlength{\cmidrulewidth}{0.6pt}

% 表格列类型：居中列
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\newcolumntype{L}{>{\raggedright\arraybackslash}X}


% =========================
% 研究进度表
% =========================
\RequirePackage{tabularray}

\newcommand{\researchprogressname}{研究进度}

\newcommand{\progressdate}[2]{%
  \begin{tabular}{@{}c@{}}
    #1\\[-0.55em]
    {\scriptsize --}\\[-0.55em]
    #2
  \end{tabular}%
}

\newenvironment{researchprogresstable}{%
  \par\vspace{18pt}%
  \noindent{\thesishei\bfseries\fontsize{15.77pt}{22pt}\selectfont \researchprogressname}\par
  \vspace{18pt}%
  \begingroup
  \noindent
  \begin{tblr}{
    width = \textwidth,
    colspec = {
      |Q[c,m,0.15\textwidth]
      |X[l,m]
      |Q[l,m,0.32\textwidth]|
    },
    hline{1-Z} = {1pt},
    vline{1-Z} = {1pt},
    rowsep = 0pt,
    colsep = 8pt,
    cells = {
      font = \thesissong\fontsize{12pt}{16pt}\selectfont,
      valign = m
    },
    row{1} = {
      font = \thesishei\bfseries\fontsize{12pt}{16pt}\selectfont,
      halign = c,
      valign = m
    }
  }
  起讫日期 & 主要研究内容 & 预期结果 \\
}{%
  \end{tblr}
  \par
  \endgroup
}

% =========================
% 数学公式
% =========================
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}
\RequirePackage{bm}

% 定理类环境
\RequirePackage{amsthm}

% 公式编号按章节编号：如 (1-1), (1-2)
\numberwithin{equation}{section}
\renewcommand{\theequation}{\thesection-\arabic{equation}}

% 常用数学命令
\newcommand{\diff}{\mathop{}\!\mathrm{d}}
\newcommand{\ee}{\mathrm{e}}
\newcommand{\ii}{\mathrm{i}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}

% 向量、矩阵
\newcommand{\vect}[1]{\bm{#1}}
\newcommand{\mat}[1]{\bm{#1}}

% 定理环境样式
\theoremstyle{definition}
\newtheorem{definition}{定义}[section]
\newtheorem{example}{例}[section]

\theoremstyle{plain}
\newtheorem{theorem}{定理}[section]
\newtheorem{lemma}{引理}[section]
\newtheorem{proposition}{命题}[section]
\newtheorem{corollary}{推论}[section]

\theoremstyle{remark}
\newtheorem{remark}{注}[section]

% =========================
% 算法 / 伪代码
% =========================
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

% 算法标题中文化
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入：}}
\renewcommand{\algorithmicensure}{\textbf{输出：}}

% 算法编号按章节编号：算法 1-1
\renewcommand{\thealgorithm}{\thesection-\arabic{algorithm}}

% 伪代码关键词中文化
\algrenewcommand\algorithmicif{\textbf{如果}}
\algrenewcommand\algorithmicthen{\textbf{则}}
\algrenewcommand\algorithmicelse{\textbf{否则}}
\algrenewcommand\algorithmicfor{\textbf{对于}}
\algrenewcommand\algorithmicdo{\textbf{执行}}
\algrenewcommand\algorithmicwhile{\textbf{当}}
\algrenewcommand\algorithmicreturn{\textbf{返回}}
\algrenewcommand\algorithmicend{\textbf{结束}}

% =========================
% 参考文献格式
% =========================
\RequirePackage{setspace}

% 英文字体：Times New Roman，找不到则用 TeX Gyre Termes
\newcommand{\thesisbiblatinfontname}{TeX Gyre Termes}
\IfFontExistsTF{Times New Roman}{
  \renewcommand{\thesisbiblatinfontname}{Times New Roman}
}{}

\newfontfamily\thesisbibtimes{\thesisbiblatinfontname}

\AtBeginDocument{%
  \renewcommand*{\bibfont}{%
    \thesissong
    \thesisbibtimes
    \fontsize{12pt}{12pt}\selectfont
    \setstretch{1}%
  }%
  \setlength{\bibitemsep}{0pt}
  \setlength{\bibparsep}{0pt}
}
