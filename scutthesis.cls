%# -*- coding: utf-8-unix -*-

%% scutthesis.cls
%% date: 2019/3/26
%% Modified from SJTUThesis by Phree
%% Sincere thanks to the original authors

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{scutthesis}[2019/03/26 v0.10 Template for South China University of Technology bachelors]
\def\version{v0.10}

\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper, UTF8, zihao=-4]{ctexbook}

\AtEndOfClass{\input{scutthesis.cfg}}

\newcommand\studentid[1]{\def\scut@value@studentid{#1}}
\newcommand\studentname[1]{\def\scut@value@studentname{#1}}
\newcommand\school[1]{\def\scut@value@school{#1}}
\newcommand\advisor[1]{\def\scut@value@advisor{#1}}
\newcommand\major[1]{\def\scut@value@major{#1}}
\newcommand\submitdate[1]{\def\scut@value@submitdate{#1}}
\newcommand\theistitle{\def\scut@value@thesistitle}
\newcommand\chinesekeywords{\def\scut@value@chinesekeywords}
\newcommand\englishkeywords{\def\scut@value@englishkeywords}

\RequirePackage{titletoc}
\RequirePackage{floatrow}
\RequirePackage{etoolbox}
\RequirePackage{geometry} %设置版面
\RequirePackage{fancyhdr}
%\RequirePackage{pageslts}
\RequirePackage[titles]{tocloft}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm, mathrsfs}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage[opentype]{sourcecodepro}
\RequirePackage{upgreek}
\RequirePackage{wasysym}
\RequirePackage{anyfontsize}
\RequirePackage{metalogo,doc}
\RequirePackage{array}
\RequirePackage{threeparttable}
\RequirePackage{diagbox}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage[backend=biber,style=gb7714-2015, doi=false, isbn=false, url=false]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{textcomp}
\RequirePackage{longtable}
\RequirePackage[perpage, bottom]{footmisc}
\RequirePackage[inline]{enumitem}
\RequirePackage{pdfpages}
\RequirePackage{calc}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
\RequirePackage{siunitx}
\RequirePackage{xparse}
\RequirePackage{tikz}
\RequirePackage{makecell}
\RequirePackage{hyperref}
\usetikzlibrary{shapes.geometric, arrows}

% patch commands
\patchcmd\cleardoublepage
  {\newpage}
  {\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter
  {\thispagestyle{\CTEX@chapter@pagestyle}}
  {}{}{}
\patchcmd\@chapter
  {\if@twocolumn}
  {\addtocontents{loa}{\protect\addvspace{10\p@}}%
   \if@twocolumn}
  {}{}
\patchcmd\tableofcontents
  {\chapter}
  {\cleardoublepage%
   \pdfbookmark[0]{\contentsname}{toc}%
   \chapter}
  {}{}

% 设置目录格式
\renewcommand\@dotsep{0.5}

\titlecontents{chapter}[0pt]
{\vspace{2pt} \bfseries\zihao{4}}
{\contentspush{\thecontentslabel\hspace{0.8em}}}
{\bfseries{\zihao{4}}}
{\titlerule*[4pt]{\mdseries{.}}\mdseries \zihao{-4} \contentspage}

% 增加粗宋体和粗黑体支持
%% for Windows Platform
% \let\cusongti\relax
% \newCJKfontfamily\cusongti{SimSun}[AutoFakeBold]
% \let\cuheiti\relax
% \newCJKfontfamily\cuheiti{Hei}[AutoFakeBold]

%% for macOS Platform
\let\cusongti\relax
\newCJKfontfamily\cusongti{STSong}[AutoFakeBold]
\let\cuheiti\relax
\newCJKfontfamily\cuheiti{Heiti}[AutoFakeBold]

\AtBeginDocument{
  \hypersetup{
    bookmarksnumbered,
    colorlinks,
    urlcolor=black,
    linkcolor=black,
    citecolor=black,
    plainpages=false,
    pdfstartview=FitH,
    pdfkeywords={scut@value@keywords},
  }
}

%\pdfstringdefDisableCommands{%
%  \let\\\@empty%
%  \let\sjtu@title@handler\@empty}

\geometry{
  paper      = a4paper,
  top        = 2.5cm,
  bottom     = 2.5cm,
  left       = 2.5cm,
  right      = 2.5cm,
}

\linespread{1.7}
%% CTeX Settings
% 名称：目录、表格索引、插图索引、算法、算法索引、代码
\ctexset{%
  contentsname   = \scut@contentsname,
  % listfigurename = \scut@listfigurename,
  % listtablename  = \scut@listtablename,
  autoindent     = true,
  chapter={%
    format       = \zihao{-2}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    fixskip      = true,
    beforeskip   = {4pt},
    afterskip    = {24pt},
  },
  section={%
    format       = \zihao{-3}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsection={%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
  },
  subsubsection={%
    format       = \zihao{-4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  paragraph={%
    afterindent = true,
    afterskip   = {10pt \@plus 2pt},
    afterskip    = {1.0ex \@plus .2ex},
  },
  subparagraph={%
    afterindent = true,
  }
}

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)

\floatname{algorithm}{\scut@label@algo}

%% 本科学位论文页眉页脚设置
\newcommand\scut@fancyhead{\small}
\newcommand\scut@fancyfoot[1]{\small #1}
\newcommand\scut@fancyheadskip{\medskip}

%% 前言页眉页脚
\fancypagestyle{front}{%
  \fancyhf{}
  \fancyfoot[C]{\scut@fancyfoot{\thepage}}
  \renewcommand{\headrulewidth}{0pt}
}

%% 正文页眉页脚
\fancypagestyle{main}{%
  \fancyhf{}
  \fancyhead[CE]{\scut@label@headeventitle \scut@fancyheadskip}
  \fancyhead[CO]{\leftmark \scut@fancyheadskip}
  \fancyfoot[C]{\scut@fancyfoot{\thepage}}
  \renewcommand{\headrulewidth}{1.4pt}
  \renewcommand{\headheight}{24pt}
}

%% 致谢页眉页脚
\fancypagestyle{thanks}{%
  \fancyhf{}
  \fancyfoot[C]{\scut@fancyfoot{\thepage}}
  \renewcommand{\headrulewidth}{0pt}
}

\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagestyle{front}
  \pagenumbering{Roman}
}

\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagestyle{main}
  \pagenumbering{arabic}
}

\floatsetup[table]{style=plain, captionskip=0.2em, capposition=top, font={small}}
\captionsetup{format=plain, labelformat=simple,labelsep=space,justification=centering, font={small}}
\captionsetup[bi-first]{bi-first}
\captionsetup[bi-second]{bi-second}
\captionsetup[sub]{font=footnotesize}

% 绘制封面
\newcommand\makecover{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \includegraphics{scutlogo}
    \vskip 30pt
    {\zihao{0}\heiti\scut@label@covertitle}
    \vskip 120pt
    {\zihao{2}\bfseries\heiti\linespread{2}\selectfont\scut@value@thesistitle}
    \vskip 60pt
    \vskip \stretch{1}
    {
      \zihao{-3}\bfseries\cusongti
      \def\arraystretch{1.1}
      %% powered by array
      \begin{tabular}{>{\begin{CJKfilltwosides}{4\ccwd}}r<{\end{CJKfilltwosides}}c}
        \scut@label@school & \makebox[10em]{\scut@value@school} \\ \cline{2-2}
        \scut@label@major & \scut@value@major \\ \cline{2-2}
        \scut@label@studentname & \scut@value@studentname \\ \cline{2-2}
        \scut@label@studentid & \scut@value@studentid \\ \cline{2-2}
        \scut@label@advisor & \scut@value@advisor \\ \cline{2-2}
        \scut@label@submitdate & \scut@value@submitdate \\ \cline{2-2}
      \end{tabular}
    }
  \end{center}
  \cleardoublepage
}

% 中文摘要 + 关键字环境
\newenvironment{abstract}{%
  \cleardoublepage
  \pdfbookmark[0]{scut@label@abstract}{abstract}
  \chapter*{\scut@label@chineseabstract}
  \addcontentsline{toc}{chapter}{\scut@label@chineseabstract}
}{
  \vskip \baselineskip
  \noindent
  {\zihao{-4} \textbf{\scut@label@chinesekeywords}{\scut@value@chinesekeywords}}
}

% 英文摘要 + 关键字环境
\newenvironment{englishabstract}{
  \cleardoublepage
  \chapter*{\scut@label@englishabstract}
  \addcontentsline{toc}{chapter}{\scut@label@englishabstract}
}{
  \vskip \baselineskip
  \noindent
  {\zihao{-4} \textbf{\scut@label@englishkeywords}{\scut@value@englishkeywords}}
}

% 致谢环境
\renewenvironment{thanks}{%
  \cleardoublepage
  \chapter*{\scut@label@thanks}
  \addcontentsline{toc}{chapter}{\scut@label@thanks}
  \pagestyle{thanks}
}{
  \cleardoublepage
}

% Ref https://github.com/sjtug/SJTUThesis/issues/186
\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter

% 使用enumitem宏包配制列表环境
% 紧凑间距
\setlist{nosep}
% 列表和段落头对齐
\setlist*{leftmargin=*}
\setlist[1]{labelindent=\parindent} % Only the level 1

% Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% 定公式、图、表、算法、代码的编号为"3-1"的形式，即分隔符由.变为短杠
\AtBeginDocument{%
  \renewcommand{\theequation}{\thechapter--\arabic{equation}}
  \renewcommand{\thefigure}{\thechapter--\arabic{figure}}
  \renewcommand\p@subfigure{\thefigure}
  \renewcommand{\thetable}{\thechapter--\arabic{table}}
  \renewcommand{\thealgorithm}{\thechapter--\arabic{algorithm}}
  \renewcommand{\thelstlisting}{\thechapter--\arabic{lstlisting}}
}

\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}
\newcommand{\void}{\rule{0.0em}{0pt}\rule[0.35em]{1em}{0.05em}\rule{0.2em}{0pt}}
\renewcommand\arraystretch{1.2}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Setting Package siunitx
\sisetup{detect-all} % Detecting fonts

% 定理环境
% 因为我校的模板中并没有关于定义, 定理等环境的说明, 因此这部分没有改变.
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
  \newtheorem{algo}{\scut@label@algo~}[chapter]
  \newtheorem{thm}{\scut@label@thm~}[chapter]
  \newtheorem{lem}[thm]{\scut@label@lem~}
  \newtheorem{prop}[thm]{\scut@label@prop~}
  \newtheorem{cor}[thm]{\scut@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\scut@label@defn~}[chapter]
  \newtheorem{conj}{\scut@label@conj~}[chapter]
  \newtheorem{exmp}{\scut@label@exmp~}[chapter]
  \newtheorem{rem}{\scut@label@rem~}
  \newtheorem{case}{\scut@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\scut@label@thm~}
  \newtheorem{blem}[thm]{\scut@label@lem~}
  \newtheorem{bprop}[thm]{\scut@label@prop~}
  \newtheorem{bcor}[thm]{\scut@label@cor~}
  \renewcommand{\proofname}{\bfseries\scut@label@proof}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following definitions add Switch statement to LaTeX algorithmicx package
% It's based on Werner's answer on stackoverflow
% http://tex.stackexchange.com/questions/53357/switch-cases-in-algorithmic

% New definitions
\algnewcommand\algorithmicswitch{\textbf{switch}}
\algnewcommand\algorithmiccase{\textbf{case}}
\algnewcommand\algorithmicdefault{\textbf{default}}

% New "environments"
% using \algtext*{<env>} removes any typesetting of that command
\algdef{SE}[SWITCH]{Switch}{EndSwitch}[1]{\algorithmicswitch\ (#1)}{\algorithmicend\ \algorithmicswitch}%
%\algtext*{EndSwitch}%
\algdef{SE}[CASE]{Case}{EndCase}[1]{\algorithmiccase\ #1:}{\algorithmicend\ \algorithmiccase}%
\algtext*{EndCase}%
\algdef{SE}[DEFAULT]{Default}{EndDefault}{\algorithmicdefault\ :}{\algorithmicend\ \algorithmicdefault}%
\algtext*{EndDefault}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following add some extra commands to LaTeX algorithmicx package

% Assert
\algnewcommand\algorithmicassert{\texttt{assert}}
\algnewcommand\Assert[1]{\State \algorithmicassert(#1)}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Setting Package listings/lstlistings
\lstset{tabsize=4, %
  frame=shadowbox, %把代码用带有阴影的框圈起来
  commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
  rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
  keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
  showstringspaces=false,%不显示代码字符串中间的空格标记
  stringstyle=\ttfamily, % 代码字符串的特殊格式
  keepspaces=true, %
  breakindent=22pt, %
  numbers=left,%左侧显示行号
  stepnumber=1,%
  numberstyle=\tiny, %行号字体用小号
  basicstyle={\footnotesize\ttfamily}, %
  showspaces=false, %
  flexiblecolumns=true, %
  breaklines=true, %对过长的代码自动换行
  breakautoindent=true,%
  breakindent=4em, %
  aboveskip=1em, %代码块边框
  %% added by http://bbs.ctex.org/viewthread.php?tid=53451
  fontadjust,
  captionpos=t,
  framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-9pt,belowcaptionskip=9pt,
  xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
  texcl=true,
  % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
  extendedchars=false,columns=flexible,mathescape=true
  numbersep=-1em,
  % 改变双引号和单引号的样式
  literate={"}{\textquotedbl}1,
  upquote=true
}