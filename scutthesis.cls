%# -*- coding: utf-8-unix -*-

%% scutthesis.cls
%% date: 2019/3/26
%% Modified from SJTUThesis by Phree
%% Sincere thanks to the original authors

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{scutthesis}[2019/03/26 v0.10 Template for South China University of Technology bachelors]
\def\version{v0.10}

\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper, UTF8, zihao=-4, linespread=1.7]{ctexbook}

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

\RequirePackage{graphicx}
\RequirePackage{titletoc}
\RequirePackage{mathtools,amsthm,amsfonts,amssymb,bm}
\RequirePackage{geometry}
\RequirePackage{array} %% for creating tabular
\RequirePackage{hyperref}
\RequirePackage[backend=biber,style=gb7714-2015]{biblatex}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{subcaption}
\RequirePackage{bicaption}
\RequirePackage{booktabs} %% needed in table environment
\RequirePackage{floatrow}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
\RequirePackage{listings}

% patch commands
\patchcmd\cleardoublepage
  {\newpage}
  {\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter
  {\thispagestyle{\CTEX@chapter@pagestyle}}
  {}{}{}

% 设置目录格式
\renewcommand\@dotsep{0.5}

\titlecontents{chapter}[0pt]
{\vspace{2pt} \bfseries\zihao{4}}
{\contentspush{\thecontentslabel\hspace{0.8em}}}
{\bfseries{\zihao{4}}}
{\titlerule*[4pt]{\mdseries{.}}\mdseries \zihao{-4} \contentspage}

% 增加粗宋体支持
\let\cusongti\relax
\newCJKfontfamily\cusongti{STSong}[AutoFakeBold]
\let\cuheiti\relax
\newCJKfontfamily\cuheiti{STHeiti}[AutoFakeBold]

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

\pdfstringdefDisableCommands{%
  \let\\\@empty%
  \let\sjtu@title@handler\@empty}

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
  },
  subsection={%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
  },
  subsubsection={%
    format       = \zihao{-4}\bfseries\heiti,
    afterindent  = true,
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true,
}


\geometry{
  paper      = a4paper,
  top        = 2.5cm,
  bottom     = 2.5cm,
  left       = 2.5cm,
  right      = 2.5cm,
}

\setcounter{secnumdepth}{4}  % 章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)


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
  \chapter*{\scut@label@thanks}
  \addcontentsline{toc}{chapter}{\scut@label@thanks}
}{}

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