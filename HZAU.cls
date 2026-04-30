% https://github.com/eriche2016/HZAU_UnderGraduateThesis_Template
% by Xinwei He (https://eriche2016.github.io/)

\ProvidesClass{HZAU}[2021/02/23 v0.1 Thesis Class of HZAU]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}

\SetupKeyvalOptions{family=CUC, prefix=CUC@, setkeys=\kvsetkeys}
\newcommand{\ckv}[1]{\kvsetkeys{CUC}{#1}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}

% 设置纸张格式
\RequirePackage[
  a4paper,
  inner=3.2cm,outer=2.5cm,top=2.5cm,bottom=2.5cm,%页面设置：页边距上下左右各用2.5cm。
  headheight=1.5cm,   % 页眉高度
  headsep=0.5cm,      % 页眉与正文之间的距离
  footskip=10mm,]{geometry}

\RequirePackage{amsthm,amsmath,amssymb,indentfirst,booktabs,multicol,multirow,xcolor,graphicx,fancyhdr,hologo,array,hyperref}

% 设置目录与引用的超链接（需要编译多次）
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=false,linkcolor={blue},urlcolor={blue},filecolor={blue},citecolor={blue},
  linktoc=all,
}

%%%%%%%%%%%%%%%%%%%%%% 字体与段落 %%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{AutoFakeBold=3}{xeCJK}
\RequirePackage[UTF8,scheme=plain]{ctex}
\setmainfont{Times New Roman}       %西文字体默认


% 1.5倍行距
\linespread{1.5}

% 段落缩进2字符
\setlength\parindent{2\ccwd}

%%%%%%%%%%%%%%%%%%%%%% 引用格式 %%%%%%%%%%%%%%%%%%%%%%




% 自定义参考文献标题
\renewcommand{\refname}{%
  \makebox[\textwidth][c]{\heiti \zihao{4} 参\hspace{1em}考\hspace{1em}文\hspace{1em}献} % 每个字之间空1个字距
  \vspace{-2em}
}
\renewcommand\figurename{图}
\renewcommand\tablename{表}

\RequirePackage{caption}
\RequirePackage{longtable}
\RequirePackage{subcaption}
\DeclareCaptionLabelSeparator{onespace}{~~}
\captionsetup[table]{skip=8pt,labelsep=onespace,justification=centering}
\captionsetup[figure]{skip=8pt,labelsep=onespace}
\captionsetup[longtable]{skip=8pt,labelsep=onespace,justification=centering}

\renewcommand{\captionfont}{\songti\zihao{5}}
\captionsetup[subfigure]{labelformat=simple,labelsep=space}
\renewcommand{\thesubfigure}{(\alph{subfigure})}

\usepackage{float} % 用于控制表格位置
% 设置表注格式
\newcommand{\tablesource}[1]{%
  \vspace{4pt} % 表题与表注之间的间距
  \parbox{\linewidth}{\songti\zihao{-5}\linespread{1.5}\selectfont #1} % 表注字体为宋体，小五号，1.5倍行距
}

% 设置图题格式
\captionsetup[figure]{
  labelsep=onespace,
  justification=centering
}

% \longtablecontinued{列数} —— 在 longtable 续页表头区块使用，输出"续表 N"
\newcommand{\longtablecontinued}[1]{%
  \multicolumn{#1}{l}{\songti\zihao{5}续表~\thetable}\\%
}

% 设置图注格式
\newcommand{\figsource}[1]{%
  \vspace{4pt} % 图题与图注之间的间距
  \parbox{\linewidth}{\songti\zihao{-5}\linespread{1.5}\selectfont #1} % 图注字体为宋体，小五号，1.5倍行距
}


% 设置插图与正文之间的间距
\setlength{\intextsep}{12pt} % 插图与正文之间上下各空一行

%%%%%%%%%%%%%%%%%%%%%% 列表（enumerate / itemize） %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{enumitem}
% 紧凑列表间距，规范§2.2 "统一行间距"
\setlist{topsep=0pt, partopsep=0pt, itemsep=0.2\baselineskip, parsep=0pt}

%%%%%%%%%%%%%%%%%%%%%% 算法/伪代码 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[ruled,linesnumbered]{algorithm2e}
% 中文化关键词
\SetKwInput{KwIn}{输入}
\SetKwInput{KwOut}{输出}
\SetKwIF{If}{ElseIf}{Else}{if}{then}{else if}{else}{end if}
\SetKwFor{For}{for}{do}{end for}
\SetKwFor{While}{while}{do}{end while}
\SetKw{Return}{return}
\SetKw{Break}{break}
% 标题字体与图表题一致（五号宋体）
\SetAlCapFnt{\songti\zihao{5}}
\SetAlCapNameFnt{\songti\zihao{5}}


%%%%%%%%%%%%%%%%%%%%%% code style %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{listings}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{defaultstyle}{
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breaklines=true,
    keepspaces=true,
    tabsize=2,
    frame=single,
}

\lstset{style=defaultstyle}

%%%%%%%%%%%%%%%%%%%%%%原创声明 %%%%%%%%%%%%%%%%%%%%%%
%声明authorization
% 重新定义 authorization 环境，添加边框
\newenvironment{authorization}{

\setlength{\parindent}{2\ccwd}  % 设置段首缩进为 2 个中文字符宽度

\thispagestyle{empty} % 本页不显示页码
\addtocounter{page}{-1} % 将页码计数器减 1
\begin{table}[h]
  \centering
  \caption*{\fontsize{16pt}{16pt}\heiti\textbf{华中农业大学学位论文独创性声明及使用授权书}}
  \label{tab:authorization}
  \renewcommand{\arraystretch}{1.8}
  \setlength{\tabcolsep}{8pt}
  \begin{tabular}{|c|c|c|c|}
    \hline
    \multirow{2}*{\shortstack{学术论文\\是否保密}} & 
    \multirow{2}*{\qquad 否 \quad} & 
    \multirow{2}*{\shortstack{如需保密，解密时间}} & 
    \multirow{2}*{年 \quad 月 \quad 日} \\
    & & & \\ % 空行实现跨行
    \hline
    \multicolumn{4}{|c|}{\fontsize{14pt}{14pt}\selectfont\centering\textbf{独创性声明}} \\ % 新增标题行
    \multicolumn{4}{|>{\linespread{1.5}\selectfont}p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth\relax}|}{ % 设置1.5倍行距
     \hspace{2\ccwd}
本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得华中农业大学或其他教育机构的学位或证书而使用过的材料，指导教师对此进行了审定。与我一同工作的同志对本研究所做的任何贡献均已在论文中做了明确的说明，并表示了谢意。
    } \\
    \multicolumn{4}{|c|}{
      签名：\underline{\raisebox{-0.5ex}{\includegraphics[width=1.5cm]{\authorSignature}}} \quad \quad \quad \quad \quad \quad \quad \quad 日期：\underline{\signatureDate}
    } \\
     \multicolumn{4}{|c|}{}  \\
    \hline
        \multicolumn{4}{|c|}{\fontsize{14pt}{14pt}\centering\textbf{学位论文使用授权书}} \\ % 新增标题行
    \multicolumn{4}{|>{\linespread{1.5}\selectfont}p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth\relax}|}{ % 设置1.5倍行距
     \hspace{2\ccwd} \songti
本人完全了解华中农业大学关于保存、使用学位论文的规定，即学生必须按照学校要求提交学位论文的印刷本和电子版本；学校有权保存提交论文的印刷版和电子版，并提供目录检索和阅览服务，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。本人同意华中农业大学可以用不同方式在不同媒体上发表、传播学位论文的全部或部分内容，为存在馆际合作关系的兄弟高校用户提供文献传递和交换服务，同时本人保留在其他媒体发表论文的权力。

\hspace{2\ccwd}\heiti\textbf{注：保密学位论文（即涉及技术秘密、商业秘密或申请专利等潜在需要提交保密的论文）在解密后适用于本授权书。}
      \vspace{0.6em}
    } \\
    \multicolumn{4}{|c|}{
     学位论文作者签名：\underline{\raisebox{-0.5ex}{\includegraphics[width=1.5cm]{\authorSignature}}} \quad \quad \quad \quad \quad \quad 导师签名：\underline{\raisebox{-0.5ex}{\includegraphics[width=1.5cm]{\mentorSignature}}}
    } \\
        \multicolumn{4}{|c|}{}  \\
        \multicolumn{4}{|c|}{
     签名日期：\underline{\signatureDate} \quad \quad 签名日期：\underline{\signatureDate}
    } \\
    \hline
  \end{tabular}
\end{table}
}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%% 摘要与关键词%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 中文摘要命令
\renewenvironment{abstract} {
\clearpage \phantomsection
\pagenumbering{roman}
\setcounter{page}{1}
\begin{center}
\vspace*{-10pt}
    \zihao{3} \heiti 摘 \qquad 要 % 标题中间空4个字距

\vspace{8pt}
\end{center}
\addcontentsline{toc}{section}{摘 \quad 要}
\zihao{-4} \ignorespaces\indent  % 添加段首缩进

} { \clearpage }



\newcommand{\keywords}[1]{%
  \par\vspace{\baselineskip}% 规范§5：另起一行，留一行视觉分隔
  \noindent\heiti{关键词：}\songti\zihao{-4} #1
}



% 英文摘要环境

\newenvironment{abstractEN}{
    \clearpage 
    \phantomsection
    \begin{center}
        \vspace*{-10pt}
        \zihao{3} \textbf{Abstract} \\
    \end{center}
    \zihao{-4} % 设置正文字号
    \setlength{\parindent}{1.25em} % 缩进5个英文字符（1.25em ≈ 5字符）
    \noindent % 防止首行额外缩进
    \ignorespaces % 忽略开头的空白
}{}


% 英文关键词命令
\newcommand{\keywordsEN}[1]{%
    \par\vspace{\baselineskip}% 规范§5：另起一行，留一行视觉分隔
    \noindent\textbf{Key words: } #1%
    \clearpage % 在关键词之后换页
}

%%%%%%%%%%%%%%%%%%%%%% 缩略语表 %%%%%%%%%%%%%%%%%%%%%%

% \abbr{缩略语}{原文} —— 在 abbreviations 环境内使用，每行一条
\newcommand{\abbr}[2]{%
  \textbf{#1} & #2 \\[4pt]%
}

\newenvironment{abbreviations}{%
  \clearpage\phantomsection
  \addcontentsline{toc}{section}{缩略语表}
  \begin{center}
    \vspace*{-10pt}
    \zihao{3}\heiti 缩\quad 略\quad 语\quad 表
    \vspace{8pt}
  \end{center}
  \zihao{-4}
  \noindent
  \begin{tabular}{@{}p{3.5cm}p{\dimexpr\linewidth-3.5cm-2\tabcolsep\relax}@{}}
}{%
  \end{tabular}
  \clearpage
}

%%%%%%%%%%%%%%%%%%%%%% 章节标题样式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{setspace,titlesec,zhnumber,titletoc}

% 修改章节编号格式
\renewcommand{\thesection}{\arabic{section}} % 一级标题：1, 2, 3
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}} % 二级标题：1.1, 1.2
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}} % 三级标题：1.1.1, 1.1.2
\renewcommand{\theparagraph}{\thesubsubsection.\arabic{paragraph}} % 四级标题：1.1.1.1, 1.1.1.2

\newcommand{\sectionbreak}{\clearpage} % 每章节清页面

% 一级标题格式
\titleformat{\section}[block]{\vspace*{-10pt} \zihao{3} \heiti \bfseries}
{\thesection~~}{0pt}{} % 1
\titlespacing*{\section}{0pt}{0pt}{\baselineskip} % 已 clearpage 在新页顶；标题后留 1 行

% 二级标题格式
\titleformat{\subsection}{\zihao{-3} \heiti \bfseries}
{\thesubsection~~}{0pt}{}  %1.1
\titlespacing*{\subsection}{0pt}{\baselineskip}{0.5\baselineskip}

% 三级标题格式
\titleformat{\subsubsection}{\zihao{4} \heiti \bfseries}
{\thesubsubsection~~}{0pt}{}  %1.1.1
\titlespacing*{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}

% 四级标题格式
\titleformat{\paragraph}[block]{\zihao{4} \songti \bfseries} % 使用 [block] 模式
{\theparagraph~~}{0pt}{}  % 1.1.1.1

\setcounter{secnumdepth}{4} % 设置标题编号深度为 4（包括 paragraph）


%%%%%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%
% 定义目录标题格式
\renewcommand\contentsname{%
  \makebox[\textwidth][c]{\heiti \zihao{4} 目\qquad\qquad 录} % 目录标题居中
}

\titlecontents{section}[0pt]{\bfseries \songti \zihao{-4}}
{\thecontentslabel~~}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsection}[1\ccwd]{\songti \zihao{-4}}
{\thecontentslabel~~}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsubsection}[2\ccwd]{\songti \zihao{-4}}
{\thecontentslabel~~}{}
{\titlerule*[0.7em]{.}\contentspage}

% 四级标题目录格式
\titlecontents{paragraph}[3\ccwd]{\songti \zihao{-4}}
{\thecontentslabel~~}{} % 四级标题编号与标题之间无空格
{\titlerule*[0.7em]{.}\contentspage}
\setcounter{tocdepth}{4} % 设置目录深度为 4（包括 paragraph）


%%%%%%%%%%%%%%%%%%%%%% 命令封装 %%%%%%%%%%%%%%%%%%%%%%

% 定义参考文献环境
\newenvironment{references}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{section}{参考文献} % 添加到目录
    \refname % 调用自定义的参考文献标题
    \vspace{1em} %添加一些垂直间距
}{
    \clearpage
}

\fancypagestyle{CUCThesisMain}{
    \fancyhf{}
    \cfoot{\songti\zihao{-5}{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
}


\newcommand{\contentpage}{
  \pagenumbering{Roman}
  \setcounter{page}{1}
  \begin{spacing}{1.5}
    \tableofcontents
  \end{spacing}

  \clearpage
}

\newcommand{\nonumsection}[1]{
  \phantomsection
  \section*{#1}
  \stepcounter{section}
  \addcontentsline{toc}{section}{#1}
}





%%%%%%%%%%%%%%%%%%%%%% 封面 %%%%%%%%%%%%%%%%%%%%%%

\newcommand{\dunderline}[3][-6pt]{{
  \setbox0=\hbox{#3}
  % 将内容 #3 放入一个盒子中
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
  % 使用 `\ooalign` 在内容下方绘制一条线：
  % `\copy0` 复制盒子中的内容
  % `\rule` 绘制一条水平线，线的位置由 `#1` 和 `#2` 控制，宽度为盒子的宽度
}}
% 定义一个名为 `dunderline` 的命令，用于在文本下方添加下划线
% 参数：
% `#1` 可选参数，默认值为 -6pt，控制下划线的垂直位置
% `#2` 必选参数，控制下划线的粗细
% `#3` 必选参数，需要添加下划线的文本

\newcommand{\infobox}[2]{
    \hspace{2.4cm}\heiti\zihao{-2}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[8cm][c]{#2}}}}
}
\newcommand{\dualinfobox}[4]{%
    \hspace{2.4cm} % 左侧缩进
    \begin{tabular}{@{}l@{}} % 无左边距，左对齐
        \zihao{-3}\songti #1: \underline{#2} \\
        \zihao{-3}\songti #3: \underline{#4} \\
    \end{tabular}%
}
% 定义一个名为 `infobox` 的命令，用于生成带下划线的信息框
% 参数：
% `#1` 信息框的标签（如“学院”、“专业”等）
% `#2` 信息框的内容
% 格式：
% `\hspace{2.4cm}` 左侧缩进 2.4cm
% `\heiti\zihao{-2}\textbf` 设置字体为黑体小二加粗
% `\dunderline{1pt}{\makebox[8cm][c]{#2}}` 在内容下方添加 1pt 的下划线，并将内容居中放在 8cm 的盒子中

\newcommand{\trbox}[2]{
\hspace{2.4cm}\heiti\zihao{-2}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[3.2cm][c]{#2}}}}
}
\newcommand{\jobbox}[2]{
\hspace{2.4cm}\heiti\zihao{-2}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[2.8cm][c]{#2}}}}
}
\newcommand{\classification}{分类号：} % 分类号
\newcommand{\security}{密级：公开}         % 密级
\newcommand{\coverpage}{ 
  \begin{titlepage}
  \pagecolor{hzaugreen}
    % ===== 左上角：分类号 =====
    \begin{textblock*}{5cm}(2cm, 2cm) % {宽度}(左距,上距)
        \raggedright % 左对齐
      \songti \zihao{-4}
        \classification
    \end{textblock*}
    
    % ===== 右上角：密级 =====
    \begin{textblock*}{5cm}(\paperwidth-8cm, 2cm) % 右距4cm
        \raggedleft % 右对齐
       \songti \zihao{-4}
        \security
    \end{textblock*}
    
    \vspace*{-15pt}
    % 向上移动 15pt，调整页面顶部间距
  
    \vspace*{2\ccwd}
    % 添加 2 个汉字宽度的垂直间距
  
    \centering
    \includegraphics[width=0.8\textwidth]{./Fig/HZAU.png}
    % 插入校徽图片，文件名为 `HZAU.png`
    % \quad \quad \quad
    % 添加一些水平间距
    
    \centering
    \zihao{0}\textbf{\songti{学士学位论文}}
    % 设置标题为“本科毕业论文”，字体为小初号宋体加粗
    
    \centering
    \zihao{2}\textbf{\songti{BACHELOR'S THESIS}}
    
    \vspace{0.6cm}
    % 添加 0.6cm 的垂直间距
  
    \zihao{-2}\textbf{\heiti\thesisTitleC}
    
    \zihao{3}\textbf{\heiti\thesisTitleE}
    % 设置论文标题，字体为二号黑体加粗
    % 添加 2.5cm 的垂直间距
  
     \flushleft  %左对齐
         \begin{spacing}{1.5}
  
 % 设置行距为 1.5 倍
    
        \infobox{ \zihao{-3}\songti{姓\hphantom{空白}名:\quad \quad \quad}}{\yourName}
        % 生成“姓名”信息框，内容为 `\yourName`
        \vspace{-0.2cm}
        \infobox{ \zihao{-3}\songti{NAME:\quad \quad \quad \quad}}{\yourNameEn}
        % 生成“姓名”信息框，内容为 `\yourName`

        \infobox{ \zihao{-3}\songti{学\hphantom{空白}号:\quad \quad  \enskip \enskip}}{\studentID}
        \vspace{-0.2cm}
        % 生成“学号”信息框，内容为 `\studentID`
         \infobox{ \zihao{-3}\songti{STUDENT NO.:\;}}{\studentID}
        % 生成“学号”信息框，内容为 `\studentID`
        
        \infobox{ \zihao{-3}\songti{专\hphantom{空白}业:\quad \quad \quad }}{\yourMajor}
        \vspace{-0.2cm}
        % 生成“专业”信息框，内容为 `\yourMajor`
        \infobox{ \zihao{-3}\songti{MAJOR:\quad \quad \quad \enskip}}{\yourMajorEn}
        % 生成“专业”信息框，内容为 `\yourMajor`
        
        \infobox{ \zihao{-3}\songti{导\hphantom{空白}师:\quad \quad \quad}}{\yourMentor \Mentorjob}
        \vspace{-0.2cm}
        \infobox{ \zihao{-3}\songti{SUPERVISOR: \enskip}}{\yourMentorEn~\MentorjobEn}


        % 生成“专业”信息框，内容为 `\yourMajor`
        % 生成“职称”信息框，内容为 `\yourjob`
        % 生成“指导教师”信息框，内容为 `\yourMentor`

    \end{spacing}
  
    \vspace{0.6cm}
    % 添加 3cm 的垂直间距
    
     \centering \zihao{4}\songti{中国 \quad  武汉}

     \centering \zihao{4}\songti{WUHAN, CHINA}

    \centering \zihao{4} \songti{\yourDateC}

       \centering \zihao{4} \songti{\yourDateEn}

  \end{titlepage}
  \nopagecolor % 回复
  \pagestyle{CUCThesisMain}
  % 设置页面样式为 `CUCThesisMain`
  \pagenumbering{Roman}
  % 设置页码格式为大写罗马数字
  \setcounter{page}{1}
  % 重置页码计数器，从 1 开始编号
}
% 定义一个名为 `coverpage` 的命令，用于生成论文封面

% white cover page 
\newcommand{\whitecoverpage}{ 
  \begin{titlepage}
  \pagecolor{white}
    % ===== 左上角：分类号 =====
    \begin{textblock*}{5cm}(2cm, 2cm) % {宽度}(左距,上距)
        \raggedright % 左对齐
      \songti \zihao{-4}
        \classification
    \end{textblock*}
    
    % ===== 右上角：密级 =====
    \begin{textblock*}{5cm}(\paperwidth-8cm, 2cm) % 右距4cm
        \raggedleft % 右对齐
       \songti \zihao{-4}
        \security
    \end{textblock*}
    
    \vspace*{-10pt}
    % 向上移动 10pt，调整页面顶部间距
  
    \vspace*{2\ccwd}
    % 添加 2 个汉字宽度的垂直间距
  
    % 插入校徽图片，文件名为 `HZAU.png`
    \quad \quad \quad
    % 添加一些水平间距
    
    \centering
    \zihao{-2}\songti{华中农业大学学士学位论文}
    % 设置标题为“本科毕业论文”，字体为小初号宋体加粗
    \vspace{1cm}
    % 添加 0.6cm 的垂直间距
  
    \zihao{-2}\textbf{\heiti\thesisTitleC}
    
    \zihao{3}\textbf{\heiti\thesisTitleE}
    % 设置论文标题，字体为二号黑体加粗
    \vspace{4.5cm}
    % 添加 2.5cm 的垂直间距
  
     \flushleft  %左对齐
         \begin{spacing}{1.5}
  
 % 设置行距为 1.5 倍
    
        \infobox{ \mdseries\zihao{-3}\songti{姓\hphantom{空白}名:}}{\yourName}
        % 生成“姓名”信息框，内容为 `\yourName`

        \infobox{ \mdseries \zihao{-3}\songti{学\hphantom{空白}号:}}{\studentID}
        % 生成“学号”信息框，内容为 `\studentID`
        
        \infobox{ \mdseries\zihao{-3}\songti{专业班级:}}{\yourClass}
        % 生成“专业”信息框，内容为 `\yourMajor`

        \infobox{ \mdseries\zihao{-3}\songti{学位类型:}}{\yourDegree}
        % 生成“专业”信息框，内容为 `\yourMajor`
        
        \infobox{ \mdseries\zihao{-3}\songti{指导教师
:}}{\yourMentor \Mentorjob}

    \end{spacing}

      \vspace{3cm}
      
    \centering
    \zihao{4}\songti{华中农业大学信息学院}\\
    \zihao{4}\songti{中国 $\cdot$ 武汉}
  
    \vspace{3cm}
    % 添加 3cm 的垂直间距


  \end{titlepage}
  \nopagecolor % 回复
  \pagestyle{CUCThesisMain}
  % 设置页面样式为 `CUCThesisMain`
  \pagenumbering{Roman}
  % 设置页码格式为大写罗马数字
  \setcounter{page}{1}
  % 重置页码计数器，从 1 开始编号
}


%%%%%%%%%%%%%%%%%%%%%% 编程语言语法高亮支持 %%%%%%%%%%%%%%%%%%%%%%

\definecolor{lightgray}{rgb}{.9,.9,.9}
\definecolor{darkgray}{rgb}{.4,.4,.4}
\definecolor{purple}{rgb}{0.65, 0.12, 0.82}
\definecolor{orange}{rgb}{0.9, 0.4, 0.0}

% ====================== JavaScript ======================
\lstdefinelanguage{JavaScript}{
  keywords={typeof, new, true, false, catch, function, return, null, switch, var, if, in, while, do, else, case, break, const},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={class, export, boolean, throw, implements, import, this, async},
  ndkeywordstyle=\color{darkgray}\bfseries,
  identifierstyle=\color{black},
  sensitive=false,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]',
  morestring=[b]"
}

% ====================== Python ======================
\lstdefinelanguage{Python}{
  keywords={and, as, assert, break, class, continue, def, del, elif, else, except, False, finally, for, from, global, if, import, in, is, lambda, None, nonlocal, not, or, pass, raise, return, True, try, while, with, yield},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={self, print, range, len, input, int, str, list, dict, set, tuple},
  ndkeywordstyle=\color{orange}\bfseries,
  identifierstyle=\color{black},
  sensitive=true,
  comment=[l]{\#},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]",
  morestring=[b]'
}

% ====================== C ======================
\lstdefinelanguage{C}{
  keywords={auto, break, case, char, const, continue, default, do, double, else, enum, extern, float, for, goto, if, inline, int, long, register, restrict, return, short, signed, sizeof, static, struct, switch, typedef, union, unsigned, void, volatile, while, _Alignas, _Alignof, _Atomic, _Bool, _Complex, _Generic, _Imaginary, _Noreturn, _Static_assert, _Thread_local},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={printf, scanf, main, include, define, malloc, free, NULL},
  ndkeywordstyle=\color{darkgray}\bfseries,
  identifierstyle=\color{black},
  sensitive=true,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]",
  morestring=[b]'
}

% ====================== C++ ======================
\lstdefinelanguage{C++}{
  keywords={alignas, alignof, and, and_eq, asm, atomic_cancel, atomic_commit, atomic_noexcept, auto, bitand, bitor, bool, break, case, catch, char, char8_t, char16_t, char32_t, class, co_await, co_return, co_yield, complex, const, const_cast, constexpr, consteval, consexpr, continue, decltype, default, delete, do, double, dynamic_cast, else, enum, explicit, export, extern, false, float, for, friend, goto, if, import, inline, int, long, module, mutable, namespace, new, noexcept, not, not_eq, nullptr, operator, or, or_eq, private, protected, public, ref, register, reinterpret_cast, requires, return, short, signed, sizeof, static, static_assert, static_cast, struct, switch, synchronized, template, this, thread_local, throw, true, try, typeid, typename, union, unsigned, using, virtual, void, volatile, wchar_t, while, xor, xor_eq},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={std, string, vector, map, cout, cin, endl, namespace, include, define},
  ndkeywordstyle=\color{orange}\bfseries,
  identifierstyle=\color{black},
  sensitive=true,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]",
  morestring=[b]'
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%附录设定%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义附录格式
\renewcommand{\appendix}{%
  \par
  \setcounter{section}{0} % 重置章节计数器
  
  % 定义附录专用的超链接目标格式
  \renewcommand{\theHsection}{appendix.\arabic{section}}
  
  % 只修改一级标题的格式
  \renewcommand{\thesection}{附录\ \Alph{section}}
  
  % 子标题带附录字母前缀（规范§3：统一编号方法 A→A.1→A.1.1→A.1.1.1）
  \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}
  \renewcommand{\thesubsubsection}{\Alph{section}.\arabic{subsection}.\arabic{subsubsection}}
  \renewcommand{\theparagraph}{\Alph{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}
  
  % 为每个附录节添加超链接锚点
  \titleformat{\section}[block]
    {\clearpage\phantomsection
     \vspace*{0pt}\zihao{4}\heiti\centering}
    {\thesection}{1em}{} % 序号与标题之间空1em
    
  \titlespacing*{\section}{0pt}{0pt}{0pt}
  
  % 重置各类计数器
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \setcounter{equation}{0}
  
  % 修改图表公式编号格式
  \renewcommand{\thefigure}{\Alph{section}-\arabic{figure}}
  \renewcommand{\thetable}{\Alph{section}-\arabic{table}}
  \renewcommand{\theequation}{\Alph{section}-\arabic{equation}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%致谢%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 定义致谢内容格式
\newenvironment{acknowledgement}{%
  \clearpage\addcontentsline{toc}{section}{致\quad 谢}
  \begin{center}
    \vspace*{-10pt}
    \zihao{3}\heiti 致\hspace{2em}谢
    \vspace{8pt}
  \end{center}
  \setlength{\parindent}{2em} % 首行缩进2字距
  \setstretch{1.5} % 1.5倍行距
  \zihao{-4} % 小四号
  \setlength{\parskip}{2pt} % 段落间距为 0


}{%
  \par    
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%脚注%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{ragged2e}
% 设置脚注格式
\usepackage{footmisc}
\renewcommand{\footnotelayout}{%
  \fontsize{9}{11}\selectfont % 小五号字体，行距为 11pt（单倍行距）
  \setlength{\parindent}{0pt} % 无缩进
  \setlength{\parskip}{0pt} % 段前0行，段后0行
  \justifying % 两端对齐
}

% 确保脚注全文连续编号
\setcounter{footnote}{0} % 重置脚注计数器

% 脚注标记格式：右上角"1）"（规范§8.2）
\renewcommand{\thefootnote}{\arabic{footnote}）}