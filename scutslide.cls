%# -*- coding: utf-8 -*-

%% scutslide.cls
%% date: 2019 May 22
%% author: Phree

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{scutslide}[2019/05/22 v0.10 Slide template for South China University of Technology thesis oral defense]
\def\version{v0.10}

\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[9pt, xcolor=table, compress]{beamer}

\RequirePackage[UTF8, noindent, heading]{ctex}
\RequirePackage{graphicx}
\RequirePackage{algorithm, algorithmicx, algpseudocode}
\RequirePackage{caption}
\RequirePackage[list=off]{bicaption}
\RequirePackage{subcaption}
\RequirePackage{listings}
% Do NOT use enumitem in beamer
% \RequirePackage{enumitem}
% \RequirePackage{times}
\RequirePackage[backend=biber,style=gb7714-2015, doi=false, isbn=false, url=false]{biblatex}
\RequirePackage{tikz}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{upgreek}
\RequirePackage{array}
\RequirePackage{listings}
\RequirePackage{threeparttable}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{siunitx}
\RequirePackage{fontspec}


\AtEndOfClass{\input{scutthesis.cfg}}
\newcommand\studentname[1]{\def\scut@value@studentname{#1}}
\newcommand\school[1]{\def\scut@value@school{#1}}
\newcommand\advisor[1]{\def\scut@value@advisor{#1}}
\newcommand\theistitle{\def\scut@value@thesistitle}

\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}
\newcommand{\void}{\rule{0.0em}{0pt}\rule[0.35em]{1em}{0.05em}\rule{0.2em}{0pt}}
\renewcommand\arraystretch{1.2}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Fix conflicts between beamer and subfig, solution is from 
% https://tex.stackexchange.com/questions/426088/texlive-pretest-2018-beamer-and-subfig-collide
\let\@@magyar@captionfix\relax

% 设置 Beamer 主题
%\setbeamerfont{footnote}{size=\tiny}
\setbeamerfont{caption}{size=\small}
%\setbeamerfont{frametitle}{size=\large}
\setbeamerfont{institute}{size=\small}
\usefonttheme[onlymath]{serif}

\useoutertheme[height=28pt, width=64pt]{sidebar}
\newcommand{\frameofframes}{/}
\newcommand{\setframeofframes}[1]{\renewcommand{\frameofframes}{#1}}

\useinnertheme{rectangles}
\usecolortheme{whale}
\usecolortheme{orchid}
\xdefinecolor{scutblue}{rgb}{0.047,0.494,0.851}  %RGB #006aae (0,106,174)
\xdefinecolor{scutred}{rgb}{0.549,0.118,0.114}  %RGB #006aae (0,106,174)

\setbeamertemplate{navigation symbols}{}

\setbeamercolor{frametitle}{fg=white, bg=scutblue}
\setbeamercolor{title}{fg=white,bg=scutblue}
\setbeamercolor{block title}{bg=scutblue}
\setbeamercolor{block title example}{use={normal text,example text},fg=example text.fg!75!normal text.fg,bg=scutblue text.bg!75!black}
\setbeamercolor{fine separation line}{}
%\setbeamercolor{palette sidebar primary}{use=normal text,fg=normal text.fg}
%\setbeamercolor{palette sidebar quaternary}{use=structure,fg=structure.fg}
%\setbeamercolor{palette sidebar secondary}{use=structure,fg=structure.fg}
%\setbeamercolor{palette sidebar tertiary}{use=normal text,fg=normal text.fg}
\setbeamercolor{section in sidebar}{fg=white, bg=scutred}
\setbeamercolor{section in sidebar shaded}{fg=white}
\setbeamercolor{separation line}{}
\setbeamercolor{sidebar}{bg=scutblue, fg=white}
\setbeamercolor{sidebar}{parent=palette primary}
\setbeamercolor{structure}{fg=scutblue}
\setbeamercolor{subsection in sidebar}{fg=white, bg=scutred}
\setbeamercolor{subsection in sidebar shaded}{fg=white}

\setbeamertemplate{itemize items}[circle]
\setbeamertemplate{enumerate items}[circle]

\setbeamertemplate{caption}[numbered]

% 设定字体
%% for macOS Platform
\let\cusongti\relax
\newCJKfontfamily\cusongti{STSong}[AutoFakeBold]
\let\cuheiti\relax
\newCJKfontfamily\cuheiti{Heiti}[AutoFakeBold]

% 定公式、图、表、算法、代码的编号为"3-1"的形式，即分隔符由.变为短杠
\AtBeginDocument{%
  \renewcommand{\theequation}{\thesection--\arabic{equation}}
  \renewcommand{\thefigure}{\thesection--\arabic{figure}}
  \renewcommand\p@subfigure{\thefigure}
  \renewcommand{\thetable}{\thesection--\arabic{table}}
  \renewcommand{\thealgorithm}{\thesection--\arabic{algorithm}}
  \renewcommand{\thelstlisting}{\thesection--\arabic{lstlisting}}
}

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
  \newtheorem{algo}{\scut@label@algo~}[section]
  \newtheorem{thm}{\scut@label@thm~}[section]
  \newtheorem{lem}[thm]{\scut@label@lem~}
  \newtheorem{prop}[thm]{\scut@label@prop~}
  \newtheorem{cor}[thm]{\scut@label@cor~}
\theoremstyle{definition}
  \newtheorem{defn}{\scut@label@defn~}[section]
  \newtheorem{conj}{\scut@label@conj~}[section]
  \newtheorem{exmp}{\scut@label@exmp~}[section]
  \newtheorem{rem}{\scut@label@rem~}
  \newtheorem{case}{\scut@label@case~}
\theoremstyle{break}
  \newtheorem{bthm}[thm]{\scut@label@thm~}
  \newtheorem{blem}[thm]{\scut@label@lem~}
  \newtheorem{bprop}[thm]{\scut@label@prop~}
  \newtheorem{bcor}[thm]{\scut@label@cor~}
  \renewcommand{\proofname}{\bfseries\scut@label@proof}

% 绘制封面
\newcommand\makecovertoc{%
  \logo{\includegraphics[width=1.5cm]{./scutlogo_transparent.png}}
  \title{\scut@value@thesistitle}
  \author[\scut@value@studentname]{\scut@value@studentname \\ \scut@label@advisor: \scut@value@advisor}
  \institute{\scut@value@school}
  \date{\today}
  \begin{frame}
    \titlepage
  \end{frame}
  \begin{frame}{目录}
    \tableofcontents
  \end{frame}
}
