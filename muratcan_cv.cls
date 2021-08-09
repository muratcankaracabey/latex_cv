% Created by Murat Can Karacabey
% this is inspired by Michael Pollind's Awesome CV 
% Created from scratch as a much simpler alternative to it to actually learn LaTeX.
% Might be interpreted as an easier-to-edit or easier-to-understand-what-is-going-on version of it.
\author{Murat Can Karacabey}
\RequirePackage[dvipsnames]{xcolor} % moved here I guess article class causes option clash with xcolor if used after loading the class
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muratcan_cv}[2020/04/15 Muratcan CV Class]
\RequirePackage[sfdefault]{noto}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage[left=0.75in,top=0.3in,right=0.75in,bottom=0.6in]{geometry} % Document margins
\RequirePackage{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{mfirstuc}
\RequirePackage{ifthen}
\RequirePackage{lipsum}
\RequirePackage{array}
\pagestyle{empty}

%Setup

\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
\newcommand*{\setlinkedinaccount}[1]{\def\@linkedinaccount{#1}}
\newcommand*{\setgithubaccount}[1]{\def\@githubaccount{#1}}

%Setup for coverletter

\newcommand*{\setcompanyname}[1]{\def\@companyname{#1}}
\newcommand*{\setcontactperson}[1]{\def\@contactperson{#1}}
\newcommand*{\setclaimedposition}[1]{\def\@claimedposition{#1}}


\hypersetup{
    colorlinks=true,
    urlcolor=cyan,
}

% View commands
% Header

% can makebox also be used?
\newcommand\headerview{
\begin{minipage}{0.25\linewidth}
    \profpic{0.22}{images/profilepicture}
\end{minipage}% 
\hfill
\begin{minipage}{0.45\linewidth}
    \center \name \\[0.05cm] 
    \contact % address \ mobile \\ mail
\end{minipage}
}

%profilpicture

\newsavebox{\picbox}
\newcommand{\profpic}[2]{%
    \savebox{\picbox}{%
    \includegraphics[scale=#1]{#2}}% 
    \tikz\node [draw, circle,%
    line width=4pt, color=white,% 
    minimum width=\wd\picbox,minimum height=\ht\picbox,%
    path picture={ \node at (path picture bounding box.center)% 
    {\usebox{\picbox}};}]% 
    {};}
    
%contactsubviews 
    
    
\newcommand{\githubview}{\href{\@linkedinaccount}{\faLinkedinSquare\ \footnotesize linkedin}}
\newcommand{\linkedinview}{\href{\@githubaccount}{\faGithubSquare\ \footnotesize github}}

\newcommand{\name}{%
    {\large \@firstname \ \textsc{\@lastname}}
}

\newcommand{\contact}{%
        {\small \@address  \cps \@mobile \\ \@mail%
        \\%
        \linkedinview \cps \githubview \\ 
        } % 
}

% Covverletterview

\newcommand\coverletter[1]{ 
\\  \coverlettersubview 
\section{} \vspace{1ex} 
\textbf{ Dear \@contactperson, \\[0.1cm]}
  #1
}

\newcommand\coverlettersubview{
\begin{tabular}{>{\scshape \bfseries \color{\@themecolor}}l  >{\small }l}
Company: & \@companyname \\
Position: & \@claimedposition \\
\end{tabular}
}


% Helper commands

\newcommand\ruleafter[1]{#1~{\color{black!60!\@themecolor}\hrulefill}} % a trick to put the line with <before> parameter in \titleformat

%colorfulpipeseperator

\newcommand{\cps}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{\@themecolor} \hspace{0.2em}\textbar\hspace{0.2em}}}

\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}

% Edit section styles

\titleformat{\section}      % Customise the \section command 
  {\large\bfseries\scshape\raggedright\color{\@themecolor}} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {\ruleafter}                           % Can be used to insert code before the heading

\titlespacing*{\section}{-1pt}{0pt}{0pt}

% Textview commands

\newcommand{\experience}[2]{%
  \mbox { \hspace{1em} \scshape \textbf{#1} }%
}

\newcommand{\datetext}[1]{%
{\itshape  \footnotesize \mdseries  \color{black!60!\@themecolor} #1 } 
}

\newcommand{\datedexperience}[2]{%
  \begin{small} \mbox { \hspace{1em} \scshape \textbf{#1} } \end{small} \hfill \datetext{#2}\\[0.01cm] %
}

\newcommand{\explanation}[1]{%
    \mbox { \scshape \hspace{1.2em} \footnotesize #1}\\[0.05cm]
}

\newcommand{\explanationdetail}[1]{%
    \indent \begin{minipage}{0.96\linewidth} \footnotesize #1 \end{minipage} \\[0.1cm]
}

\newcommand{\itemwithtext}[1]{%
    \begin{minipage}{\linewidth} \footnotesize \item #1 \end{minipage}
}

\newcommand{\addblocktext}[2]{%
  \section{#1} 
  \indent \explanationdetail{\hspace{4ex} #2}
}

\newcommand\createskill[2]{%
    \textsc{\textbf{#1}} & #2
}

\newcommand\createtablecontent[1]{%
    \foreach \x [count=\xi] in {#1} {\ifthenelse{\xi=1}{\x}{\\ \x}}
}

\newcommand\createskillsanothertry[1]{%not used
  \begin{tabular}{r|l}
      \createtablecontent{#1}
        \end{tabular}
}

\newcommand\createskills[1]{%
\explanationdetail{
  \begin{tabular}{rl}
    \makeatletter
    \@for\thisitem:=#1\do{\thisitem\\[0.1cm]}
    \makeatother
    \end{tabular}
}
}

\newcommand\createbullets[1]{%
    \renewcommand{\labelitemi}{\coloredbullet}
  \begin{itemize}
    \makeatletter
    \@for\thisitem:=#1\do{\itemwithtext{\thisitem}}
    \makeatother
  \end{itemize}
}

\newcommand\createfootnote{%
  \renewcommand{\footnotesize}{\fontsize{7pt}{11pt}\selectfont}
    \renewcommand\footnoterule{\rule{0.3\linewidth}{0.5pt}}
    \let\thefootnote\relax\footnote{\today\ / \href{https://github.com/muratcankaracabey/latex_cv}{source code}}}


