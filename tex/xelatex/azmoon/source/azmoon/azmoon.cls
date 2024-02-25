\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{azmoon}[2018/06/11 version 0.1 by Mojtaba Baghban]

\def\azmoonversion{0.1}

\newif\if@printlinesep
\@printlineseptrue

\newlength{\leftmg}
\newlength{\rightmg}
\newlength{\topmg}
\newlength{\bottommg}
\setlength\leftmg{1.5cm}
\setlength\rightmg{1.5cm}
\setlength\topmg{.5cm}
\setlength\bottommg{.5cm}

\def\templ@te{tabling}
\def\he@der{tabling}
\def\b@dy{tabling}
\def\p@persize{a4paper}
\def\f@ntsize{11pt}
\def\he@dstatus{}
%\def\he@donall{headonall}
%\def\he@donfirst{headonfirst}
\def\nohe@d{nohead}

\def\settempl@te#1{%
	\def\fantasytext{fantasy}%
	\def\classixtext{classic}%
	\def\tablingtext{tabling}%
	\def\farsnohomtext{farsnohom}%
	\def\templ@te@rg{#1}
	\ifx\fantasytext\templ@te@rg%
		\def\b@dy{fantasy}%
		\def\he@der{fantasy}%
	\else\ifx\classictext\templ@te@rg%
		\def\b@dy{classic}%
		\def\he@der{classic}%
	\else\ifx\tablingtext\templ@te@rg%
		\def\b@dy{tabling}%
		\def\he@der{tabling}%
	\else\ifx\farsnohomtext\templ@te@rg%
		\def\b@dy{tabling}%
		\def\he@der{farsnohom}%
	\fi\fi\fi\fi%
}

\RequirePackage{pgfopts}
\def\@side{twoside}
\def\exa@classoptions{}
\pgfkeys{
	/azm/.cd,
	a4paper/.value forbidden,
	a4paper/.style={papersize=a4paper},
	a3paper/.value forbidden,
	a3paper/.style={papersize=a3paper},
	a5paper/.value forbidden,
	a5paper/.style={papersize=a5paper},
	papersize/.value required,
	papersize/.is choice,
		papersize/a3paper/.code={\def\p@persize{a3paper}},
		papersize/a4paper/.code={\def\p@persize{a4paper}},
		papersize/a5paper/.code={\def\p@persize{a5paper}},
	template/.value required,
	template/.code={\settempl@te#1},
	header/.value required,
	header/.store in=\he@der,
	body/.value required,
	body/.store in=\b@dy,
	10pt/.value forbidden,
	10pt/.style={fontsize=10pt},
	11pt/.value forbidden,
	11pt/.style={fontsize=11pt},
	12pt/.value forbidden,
	12pt/.style={fontsize=12pt},
	fontsize/.value required,
%	fontsize/.is choice,
%		fontsize/10pt/.code={\def\f@ntsize{10pt}},
%		fontsize/11pt/.code={\def\f@ntsize{11pt}},
%		fontsize/12pt/.code={\def\f@ntsize{12pt}},
	fontsize/.code={\edef\exa@classoptions{\exa@classoptions,#1}},
	twoside/.value forbidden,
	twoside/.code={\def\@side{twoside}},
	oneside/.value forbidden,
	oneside/.code={\def\@side{oneside}},
	headonall/.value forbidden,
	headonall/.style={headstatus=headonall},
	headonfirst/.value forbidden,
	headonfirst/.style={headstatus=headonfirst},
	nohead/.value forbidden,
	nohead/.style={headstatus=nohead},
	headstatus/.value required,
	headstatus/.is choice,
%		headstatus/headonall/.code={\def\he@dstatus{headonall}},
%		headstatus/headonfirst/.code={\def\he@dstatus{headonfirst}},
		headstatus/nohead/.code={\def\he@dstatus{nohead}},
	leftmargin/.code={\setlength\leftmg{#1}},
	rightmargin/.code={\setlength\rightmg{#1}},
	topmargin/.code={\setlength\topmg{#1}},
	bottommargin/.code={\setlength\bottommg{#1}},
	margin/.style={leftmargin=#1,rightmargin=#1,topmargin=#1,bottommargin=#1},
	.unknown/.code={\edef\exa@classoptions{\exa@classoptions,\pgfkeyscurrentname}}
}
\ProcessPgfOptions{/azm}
\edef\exa@classoptions{\exa@classoptions,\@side}
\LoadClass[\exa@classoptions]{book}

\RequirePackage{amsmath}
\RequirePackage{cancel}
\RequirePackage{autofancyhdr}
%\RequirePackage{textcomp}
%\RequirePackage{gensymb}
\RequirePackage{enumitem}
\RequirePackage{totcount}
\RequirePackage{lastpage}
\RequirePackage{marginnote}
\RequirePackage{varwidth}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{xstring}
\RequirePackage{dashrule}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{arrows}
\RequirePackage{forest}
\RequirePackage{geometry}
\RequirePackage{textmerg}
\RequirePackage{trimspaces}
%\RequirePackage{environ}
%\RequirePackage{ocg-p}
\RequirePackage{fouriernc}
\RequirePackage{etoolbox}
%\RequirePackage{environ}
\RequirePackage{biditools}

\newcommand\printlinesep{\@printlineseptrue}
\newcommand\noprintlinesep{\@printlinesepfalse}

\newcommand*\teacher@title{معلم}
\newcommand*\teacher@name{}
\newcommand*\student@name{}
\newcommand*\student@firstname{}
\newcommand*\student@lastname{}
\newcommand*\student@fathername{}
\newcommand*\student@code{}
\newcommand*\ch@irnumber{}
\newcommand*\c@urse{}
\newcommand*\answer@time{}
\newcommand*\exam@date{}
\newcommand*\ex@mtime{}
\newcommand*\ex@mturn{}
\newcommand*\@examcode{}
\newcommand*\examcode[1]{\renewcommand*\@examcode{#1}}
\newcommand*\me@surementtype{}
\newcommand*\@topic{}
\newcommand*\@grade{}
\newcommand*\@branch{}
\newcommand*\@field{}
\newcommand*\school@title{مدرسه}
\newcommand*\@school{}
\newcommand*\@city{}
\newcommand*\st@te{}
\newcommand*\sch@olyear{}
\newcommand*\s@mester{}
\edef\student@photo{}
\newcommand*\chair@number{}
\def\@studentsinfo{}
\def\studentsinfo#1{\def\@studentsinfo{#1}}
\def\l@g@{nologo.jpg}
\edef\l@go{\l@g@}
%\def\l@go{nologo.png}
\newcommand{\hi@note}{}
\newcommand{\bye@note}{}
\newcommand*{\answer@color}{blue}
\newcommand*{\ques@color}{black}
\newcommand*{\quesbox@color}{white}
\newcommand*{\quesboxrule@color}{black}
\newcommand*{\quesnumber@color}{black}
\newcommand*{\quesnumberbox@color}{white}
\newcommand*{\quespoint@color}{black}
\newcommand*{\quespointbox@color}{white}
\newcommand*{\head@answer@color}{blue}
\newcommand*{\head@ques@color}{black}
\newcommand*{\headbox@color}{white}
\newcommand*{\headboxrule@color}{black}
\def\logo@width{2cm}
\def\logo@height{2cm}
\pgfkeys{
	/logo/.cd,
	width/.store in=\logo@width,
	height/.store in=\logo@height
}
\newcommand*\logo[2][]{%
	\pgfkeys{/logo/.cd,#1}
	\edef\l@go{#2}%
}
\newcommand\examdate[1]{\renewcommand{\exam@date}{#1}}
\newcommand\examtime[1]{\renewcommand{\ex@mtime}{#1}}
\newcommand\examturn[1]{\renewcommand{\ex@mturn}{#1}}
\newcommand\course[1]{\renewcommand{\c@urse}{#1}}
\newcommand\measurementtype[1]{\renewcommand{\me@surementtype}{#1}}
\newcommand\hinote[1]{\renewcommand{\hi@note}{#1}}
\newcommand\byenote[1]{\renewcommand{\bye@note}{#1}}
\newcommand\topic[1]{\renewcommand{\@topic}{#1}}
\newcommand\grade[1]{\renewcommand{\@grade}{#1}}
\newcommand\branch[1]{\renewcommand{\@branch}{#1}}
\newcommand\field[1]{\renewcommand{\@field}{#1}}
\newcommand\schooltitle[1]{\renewcommand{\school@title}{#1}}
\newcommand\school[1]{\renewcommand{\@school}{#1}}
\newcommand\city[1]{\renewcommand{\@city}{#1}}
\newcommand\state[1]{\renewcommand{\st@te}{#1}}
\newcommand\schoolyear[1]{\renewcommand{\sch@olyear}{#1}}
\newcommand\semester[1]{\renewcommand{\s@mester}{#1}}
\newcommand\teacher[1]{\renewcommand{\teacher@name}{#1}}
\newcommand\teachertitle[1]{\renewcommand{\teacher@title}{#1}}
\newcommand\studentfirstname[1]{\renewcommand{\student@firstname}{#1}}
\newcommand\studentlastname[1]{\renewcommand{\student@lastname}{#1}}
\newcommand\student[1]{\renewcommand{\student@name}{#1}}
\newcommand\studentfathername[1]{\renewcommand{\student@fathername}{#1}}
\newcommand\studentcode[1]{\renewcommand{\student@code}{#1}}
\newcommand\answertime[1]{\renewcommand{\answer@time}{#1}}
\newcommand\answercolor[1]{\renewcommand{\answer@color}{#1}}
\newcommand\quescolor[1]{\renewcommand{\ques@color}{#1}}
\newcommand\quesboxcolor[1]{\renewcommand{\quesbox@color}{#1}}
\newcommand\quesboxrulecolor[1]{\renewcommand{\quesboxrule@color}{#1}}
\newcommand\quesnumbercolor[1]{\renewcommand{\quesnumber@color}{#1}}
\newcommand\quesnumberboxcolor[1]{\renewcommand{\quesnumberbox@color}{#1}}
\newcommand\quespointcolor[1]{\renewcommand{\quespoint@color}{#1}}
\newcommand\quespointboxcolor[1]{\renewcommand{\quespointbox@color}{#1}}
\newcommand\headanswercolor[1]{\renewcommand{\head@answer@color}{#1}}
\newcommand\headquescolor[1]{\renewcommand{\head@ques@color}{#1}}
\newcommand\headboxcolor[1]{\renewcommand{\headbox@color}{#1}}
\newcommand\headboxrulecolor[1]{\renewcommand{\headboxrule@color}{#1}}
\newcommand\studentphoto[1]{\edef\student@photo{#1}}
\newcommand\chairnumber[1]{\renewcommand{\chair@number}{#1}}

\newif\ifanswermode
\answermodefalse

\newcommand{\showanswers}{\answermodetrue}
\newcommand{\hideanswers}{\answermodefalse}

\newlength{\totalpoint}
\newlength{\sumpoint}
\newlength{\he@dsep}

\setlength\he@dsep{0pt}

\IfFileExists{\b@dy bdy}{
	\input{\b@dy bdy}
}
{\ClassError{azmoon}{file \b@dy bdy.tex not exist}{}}
\IfFileExists{\he@der hdr}{
	\input{\he@der hdr}
}
{\ClassError{azmoon}{file \he@der hdr.tex not exist}{}}


\geometry{\p@persize,top=\topmg,bottom=\bottommg,right=\rightmg,left=\leftmg,
	headsep=\he@dsep,marginparsep=.2cm,
	marginparwidth=1.4cm,footskip=0pt,includehead,includefoot}
\newcommand{\truesym}{%
	\hspace{0cm}%
	\begin{tikzpicture}[baseline={([yshift=-.9ex]current bounding box.center)}]
	\draw[thick,rounded corners=1pt,line join=round] (-.15,0) -- (0,-.15) -- (.3,.35);
	\end{tikzpicture}
}
\newcommand{\falsesym}{%
	\hspace{0cm}%
	\begin{tikzpicture}[baseline={([yshift=-.9ex]current bounding box.center)}]
	\draw[thick] (-.15,.15) -- (.15,-.15) (.15,.15) -- (-.15,-.15);
%	\draw[thick] (.18,.18) -- (-.18,-.18);
	\end{tikzpicture}
}
\newtotcounter{numques}
\newtotcounter{numbonques}
\newenvironment{questions}{%
	\setlength{\sumpoint}{0pt}%
	\setcounter{numques}{0}%
	\setcounter{numbonques}{0}%
	\def\@point{\@nil}%
	\def\@bonpoint{\@nil}%
	\pgfkeys{
		/question/.cd,
		stars/.store in=\st@rs,
		1s/.value forbidden,
		1s/.style={stars=1},
		2s/.value forbidden,
		2s/.style={stars=2},
		3s/.value forbidden,
		3s/.style={stars=3},
		4s/.value forbidden,
		4s/.style={stars=4},
		5s/.value forbidden,
		5s/.style={stars=5},
		.unknown/.code={\edef\@point{\pgfkeyscurrentname}}
	}
	\newcommand{\question}[2][\@nil]{%
		\def\st@rs{\@nil}%
	\def\quesopt{##1}%
	\ifx\quesopt\@nnil\else%
		\pgfkeys{/question/.cd,##1}%
%		\LTR\meaning\@point%
	\fi%
%		\def\@point{##1}%
		\def\ques@body{##2}%
		\ifx\@point\@nnil\else%
			\global\addtolength{\sumpoint}{\@point pt}%
		\fi%
		\stepcounter{numques}%
		\ifdefined\@question%
			\@question{\thenumques}{\ques@body}{\@point}{\st@rs}%
		\else%
			\ClassError{azmoon}{command \string\@question\ is not defined}{}
		\fi%
	}%
	\pgfkeys{
		/bonusquestion/.cd,
		stars/.store in=\st@rs,
		1s/.value forbidden,
		1s/.style={stars=1},
		2s/.value forbidden,
		2s/.style={stars=2},
		3s/.value forbidden,
		3s/.style={stars=3},
		4s/.value forbidden,
		4s/.style={stars=4},
		5s/.value forbidden,
		5s/.style={stars=5},
		.unknown/.code={\edef\@bonpoint{\pgfkeyscurrentname}}
	}
	\newcommand{\bonusquestion}[2][\@nil]{%
		\def\st@rs{\@nil}%
		\def\bonquesopt{##1}%
		\ifx\bonquesopt\@nnil\else%
			\pgfkeys{/bonusquestion/.cd,##1}%
	%		\LTR\meaning\@point%
		\fi%
		% \def\@point{##1}%
		\def\ques@body{##2}%
		\ifx\@point\@nnil\else%
%		\global\addtolength{\sumpoint}{##1pt}%
		\fi%
		\stepcounter{numbonques}%
		\ifdefined\@question%
		\@question{\thenumbonques}{\ques@body}{\@bonpoint}{\st@rs}%
		\else%
		\ClassError{azmoon}{command \string\@question\  isnot defined}{}
		\fi%
	}%
	\newcommand\draft[1]{%
		\ifdefined\@draft%
			\@draft{##1}%
		\else%
			\ClassError{azmoon}{command \string\@draft not defined}{}
		\fi%
	}%
	\newcommand*{\group}[1]{%
		\ifdefined\@section%
			\@section{##1}%
		\else%
			\ClassError{azmoon}{command \string\@section@ not defined}{}%
		\fi%
	}%
	\newcommand{\answer}[2][0pt]{%
		{%
			\newbox\@answerbox%
			\setbox\@answerbox=\vbox{##2}%
%			$\the\ht\@answerbox$%
			\large%
			\baselineskip=1.5\baselineskip
			\ifanswermode \bidicolor{##2}\else%
				\color{white}##2
%				\ifdim ##1=0pt%
%					\vspace*{##1}%
%				\else%
%					\vspace*{##1}%
%				\fi%
			\fi%
		}%
	}%
	\ifdefined\@bquestions%
		\@bquestions%
	\fi%
}
{%
	\ifdefined\@equestions%
	\@equestions%
	\fi%
}%
\newcommand{\tf}[1][]{
		\def\argvalue{#1}%
		\def\truevalue{t}%
		\def\falsevalue{f}%
		\def\trueopacity{0}%
		\def\falseopacity{0}%
		\ifx\argvalue\falsevalue\def\falseopacity{1}\fi%
		\ifx\argvalue\truevalue\def\trueopacity{1}\fi%
		\hspace{0cm}%
		\begin{tikzpicture}[baseline={([yshift=-.7ex]current bounding box.center)}]
		\draw (0,0) circle (.25);
		\ifanswermode%
		\draw[very thick,color=\answer@color,opacity=\falseopacity] (-.15,.15) -- (.15,-.15) (.15,.15) -- (-.15,-.15);
%		\draw[very thick,color=\answer@color,opacity=\falseopacity] (.18,.18) -- (-.18,-.18);
		\draw[very thick,color=\answer@color,opacity=\trueopacity,rounded corners=1pt,line join=round] (-.15,0) -- (0,-.15) -- (.3,.35);
%		\draw[very thick,color=\answer@color,opacity=\trueopacity] (0,-.15) -- (.3,.35);
		\fi
		\end{tikzpicture}%
	}%
\newcommand\IfDimen[3]{%	
	\edef\dimstr{#1}%
	\trim@spaces@in\dimstr%
	\def\units{em,ex,in,pt,pc,cm,mm,dd,cc,bp,sp}%
	\def\res{true}%
	\def\@istrue{true}%
	\StrRight{\dimstr}{2}[\unitpart]%
	\StrGobbleRight{\dimstr}{2}[\numpart]%
	\trim@spaces@in\unitpart%
	\trim@spaces@in\numpart%
	\IfSubStr{\units}{\unitpart}{}{\def\res{false}}%
	\IfDecimal{\numpart}{}{\def\res{false}}%
	\ifx\res\@istrue#2\else#3\fi%
}
\edef\@blanklength{2cm}
\edef\blank@style{dash}
\def\blankstyle#1{\edef\blank@style{#1}}
\newlength{\@blank@length}
\setlength\@blank@length{\@blanklength}
\newcommand*{\blanklengrh}[1]{\edef\@blanklength{#1}}
\def\blank{%
	\@ifnextchar[{\blankonearg}{\blanktwoarg[\@blanklength][]}%
}%
\def\blankonearg[#1]{%
	\@ifnextchar[{\blanktwoarg[#1]}{%
		\IfDimen{#1}{\blanktwoarg[#1][]}{%
			\settowidth{\@blank@length}{\large#1}%
			\addtolength\@blank@length{.5mm}%
			\edef\@blanklength{\strip@pt\@blank@length pt}%
			\expandafter\blanktwoarg\expandafter[\@blanklength][#1]%
		}%		
	}%
}
\def\blanktwoarg[#1][#2]{%
	\edef\blank@space{space}
	\edef\blank@dash{dash}
	\IfDimen{#1}%
		{\def\@len{#1}\def\@text{#2}}%
		{\def\@len{#2}\def\@text{#1}}%	
	\ifanswermode{\rlap{\ifx\blank@style\blank@dash\hbox{\hdashrule{\@len}{.5pt}{1pt 1pt}}\ \else\ifx\blank@style\blank@space\hspace{\@len}\else\hspace{\@len}\fi\fi}{\makebox[\@len]{\large\color{\answer@color}\@text}}\ }%
	\else%
	\ifx\blank@style\blank@dash\hbox{\hdashrule{\@len}{.5pt}{1pt 1pt}}\ \else\ifx\blank@style\blank@space\hspace*{\@len}\else\hspace{\@len}\fi\fi%
	\fi%
}
\edef\@blankcirclength{0.7em}%
\newcommand\blankcirclength[1]{\edef\@blankcirclength{#1}}
\def\blankcirc{%
	\@ifnextchar[{\blankcirconearg}{\blankcirctwoarg[\@blankcirclength][]}%
}%
\def\blankcirconearg[#1]{%
	\@ifnextchar[{\blankcirctwoarg[#1]}{%
		\IfDimen{#1}{\blankcirctwoarg[#1][]}{\blankcirctwoarg[#1][\@blankcirclength]}%		
	}%
}
\def\blankcirctwoarg[#1][#2]{%
	\IfDimen{#1}%
	{\def\@len{#1}\def\@text{#2}}%
	{\def\@len{#2}\def\@text{#1}}%	
	\begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
	\draw (0,0) circle (\@len) node[pos=.5] {\ifanswermode \color{\answer@color} \@text \fi};
	\end{tikzpicture}%
}
\edef\@blankreclength{1.1em}%
\newcommand\blankreclength[1]{\edef\@blankreclength{#1}}
\def\blankrec{%
	\@ifnextchar[{\blankreconearg}{\blankrectwoarg[\@blankreclength][]}%
}%
\def\blankreconearg[#1]{%
	\@ifnextchar[{\blankrectwoarg[#1]}{%
		\IfDimen{#1}{\blankrectwoarg[#1][]}{\blankrectwoarg[#1][\@blankreclength]}%		
	}%
}
\def\blankrectwoarg[#1][#2]{%
	\IfDimen{#1}%
	{\def\@len{#1}\def\@text{#2}}%
	{\def\@len{#2}\def\@text{#1}}%	
	\begin{tikzpicture}[baseline={([yshift=-.5ex]current bounding box.center)}]
	\draw (0,0) rectangle (\@len,\@len) node[pos=.5] {\ifanswermode \color{\answer@color} \@text \fi};
	\end{tikzpicture}%
}
\def\ml@part@space{.3333\linewidth}
\def\ml@line@space{1ex}
\pgfkeys{
	/matchingline/.cd,
	part space/.store in=\ml@part@space,
	line space/.store in=\ml@line@space
}
\newenvironment{matchingline}[1][]
{%
	\par%
	\hspace{0cm}%
	\newif\ifisRTL%
	\if@RTL \isRTLtrue \else \isRTLfalse\fi%
	\pgfkeys{/matchingline/.cd,#1}%
	\newcount\num@pair\num@pair=0%
	\newcount\num@parta\num@parta=0%
	\newcount\num@partb\num@partb=0%
	\newdimen\a@height\a@height=0pt%
	\newdimen\b@height\b@height=0pt%
	\newdimen\line@space\line@space=0.5ex%
	\newcommand\head[2]{%
		\def\headparta{\hbox{\textbf{##1}}}%
		\def\headpartb{\hbox{\textbf{##2}}}%
	}%
	\newcommand\pair[2]{%
		\def\arg@a{##1}%
		\def\arg@b{##2}%
		\def\arg@emp{}%
		\ifx\arg@a\arg@emp%
		\expandafter\let\csname parta\the\num@pair\endcsname\relax%
		\else%
		\expandafter\newbox\csname parta\the\num@pair\endcsname%
		\expandafter\setbox\csname parta\the\num@pair\endcsname=\hbox{%
			\begin{tikzpicture}[remember picture]%
			\ifisRTL \setRTL\fi%
			\node[circle, fill, minimum size=.2cm, inner sep=0pt] (0,0) (ac\the\num@pair){};
			\node[minimum height=0.5cm,minimum width=1cm,draw, rounded corners=.5ex, anchor=\ifisRTL west\else east\fi] at (\ifisRTL\else-\fi.2,0)(a\the\num@pair){%
				\begin{varwidth}{\linewidth}%
					##1%
				\end{varwidth}%
			};%
			\end{tikzpicture}%
		}%
		\advance \num@parta by 1%
		\fi%
		\ifx\arg@b\arg@emp%
		\expandafter\let\csname partb\the\num@pair\endcsname\relax%
		\else%
		\expandafter\newbox\csname partb\the\num@pair\endcsname%
		\expandafter\setbox\csname partb\the\num@pair\endcsname=\hbox{%
			\begin{tikzpicture}[remember picture]%
			\ifisRTL \setRTL\fi%
			\node[circle, fill, minimum size=.2cm, inner sep=0pt] (0,0) (bc\the\num@pair){};
			\node[minimum height=0.5cm,minimum width=1cm,draw, rounded corners=.5ex, anchor=\ifisRTL east\else west\fi] at (\ifisRTL-\else\fi.2,0)(b\the\num@pair){%
				\begin{varwidth}{\linewidth}%
					##2%
				\end{varwidth}%
			};%
			\end{tikzpicture}%
		}%
		\advance \num@partb by 1%
		\fi%
		\advance\num@pair by 1%
	}%
}%
{%
	\advance\num@pair by -1\relax%
	\advance \num@parta by -1\relax%
	\advance \num@partb by -1\relax%
	\newbox\parta%
	\newbox\partb%
	\def\randomize@list{%
		\foreach \x in {0,...,\num@pair}{%
			\expandafter\global\expandafter\edef\csname rand\x\endcsname{\x}%
		}%
		\def\@change{%
			\edef\@temp{\csname rand\x\endcsname}%
			\expandafter\global\expandafter\edef\csname rand\x\endcsname{\csname rand\@rand\endcsname}%
			\expandafter\global\expandafter\edef\csname rand\@rand\endcsname{\@temp}%
		}%
		\foreach \x in {0,...,\num@pair}{%
			\pgfmathsetmacro{\@rand}{random(\x,\num@pair)}%
			\@change%
		}%
	}%
	\def\make@part##1##2##3{%
		\randomize@list%
		\edef\num@partab{\csname num@##1\endcsname}%
		\newcount\cur@partab\cur@partab=0%
		\expandafter\setbox\csname ##1\endcsname=\vbox{%
			\ifcsname head##1\endcsname%
				\csname head##1\endcsname%
				\vspace{1ex}%
			\fi%
			\foreach \x in {0,...,\num@pair}{%
				\edef\cur{\csname rand\x\endcsname}%
				\expandafter\ifx\csname ##1\cur\endcsname\relax\relax\else%
					\hbox \ifdim ##3>0pt to ##3\fi {\ifdim ##3>0pt \hfill\fi\expandafter##2\csname ##1\cur\endcsname}%
					\ifnum\cur@partab<\num@partab%
						\vspace{\line@space}%
					\fi%
					\global\advance \cur@partab by 1\relax%
				\fi%
			}%
		}%
	}%
	\make@part{parta}{\copy}{0pt}%
	\make@part{partb}{\copy}{0pt}%
	\ifdim\ht\parta>\ht\partb%
		\ifnum\num@partb>0%
			\line@space=\dimexpr \line@space+(\ht\parta-\ht\partb)/(\num@partb)\relax%
		\fi%
		\make@part{partb}{\box}{0pt}%
	\else%
		\ifnum\num@parta>0%
			\line@space=\dimexpr \line@space+(\ht\partb-\ht\parta)/(\num@parta)\relax%
		\fi%
		\make@part{parta}{\box}{\wd\parta}%
	\fi%
	\newbox\matching@box%
	\setbox\matching@box=\vbox{\hbox{%
		\box\parta%
		\hspace{\ml@part@space}%
		\box\partb%
	}}%
	\box\matching@box
	\ifanswermode% 
		\begin{tikzpicture}[overlay, remember picture]%
		\foreach \x in {0,...,\num@pair}{%
			\expandafter\ifx\csname parta\x\endcsname\relax\relax\else%
			\expandafter\ifx\csname partb\x\endcsname\relax\relax\else%
			\draw[\answer@color, very thick, out=\ifisRTL 180\else 0\fi, in=\ifisRTL 0\else 180\fi] (ac\x.center) to (bc\x.center);
			\fi\fi%
		}%
		\end{tikzpicture}%
	\fi%
}


\newcounter{numparts}%
\newcounter{numpart}%
\newcounter{curpart}%
\newlength{\partlength}
\setlength{\partlength}{\linewidth}
\newlength{\verticalspace}
\setlength{\verticalspace}{0pt}
\newif\if@labeling
\@labelingtrue
\pgfkeys{
	/parts/.cd,
	numcols/.store in=\num@cols,
	vertical space/.code={\setlength{\verticalspace}{#1}},
	1/.value forbidden,
	1/.style={numcols=1},
	2/.value forbidden,
	2/.style={numcols=2},
	3/.value forbidden,
	3/.style={numcols=3},
	4/.value forbidden,
	4/.style={numcols=4},
	5/.value forbidden,
	5/.style={numcols=5},
	6/.value forbidden,
	6/.style={numcols=6},
	label/.default=Alph,
	label/.code={\@labelingtrue\edef\label@type{#1}},
	without label/.value forbidden,
	without label/.code={\@labelingfalse}
}
\newlength{\partsep}%
\newenvironment{parts}[1][1]{%
	\edef\parts@opt{#1}%
	\pgfkeys{/parts/.cd,numcols=1,label=Alph,#1}%
	\setlength{\partsep}{0cm}%
	\def\numcols##1{%
		\def\num@cols{##1}%
			\setlength{\partlength}{\dimexpr \linewidth / \num@cols-\partsep\relax}%
	}%
	\setlength{\partlength}{\dimexpr \linewidth / \num@cols-\partsep\relax}%
	\par%
	\setcounter{numparts}{0}%
	\setcounter{numpart}{0}%
	\setcounter{curpart}{0}%
	\renewcommand{\part}[1]{%
		\stepcounter{numparts}%
		\stepcounter{numpart}%
		\stepcounter{curpart}%
		\ifnum\num@cols>1%
			\begin{minipage}[t]{\partlength}%
				\if@labeling\if@RTL\parbox[b]{1.5em}{\hfill\csname\label@type\endcsname{numpart})}\else\parbox[b]{1.5em}{\hfill(\csname\label@type\endcsname{numpart}}\fi\fi\ ##1%
			\end{minipage}%
			\if@labeling\else\hskip\partsep\fi%
		\else%
			\if@labeling\if@RTL\parbox[b]{1.5em}{\hfill\csname\label@type\endcsname{numpart})}\else\parbox[b]{1.5em}{\hfill(\csname\label@type\endcsname{numpart}}\fi\fi\ ##1%
		\fi%
		\ifdim\verticalspace>0pt\vspace{\verticalspace}\fi%
		\ifnum\value{curpart}=\num@cols%
		\setcounter{curpart}{0}\par\else\fi%
	}%
	}%
	{%
}%
\newenvironment{filling}[1][1]{%
\newcommand{\fillin}[1]{%
\part{##1}
}
\begin{parts}[#1]
}
{%
\end{parts}
}
%\newcounter{numchoice}%
\newcounter{choicenumparts}%
\newcounter{choicenumpart}%
\newcounter{choicecurpart}%
\newlength{\choiceverticalspace}
\setlength{\choiceverticalspace}{0pt}
\newlength{\choicepartlength}
\setlength{\choicepartlength}{\linewidth}
\newif\if@checkbox%
\newif\if@randomchoicesort%
\@randomchoicesortfalse%
\newif\if@choicelabeling
\@choicelabelingtrue
\def\randomchoicesort{\@randomchoicesorttrue}
\def\manualchoicesort{\@randomchoicesortfalse}
\pgfkeys{
	/multichoice/.cd,
	numcols/.store in=\choicenum@cols,
	vertical space/.code={\setlength{\verticalspace}{#1}},
% 	label type/.store in=\label@type,
	1/.value forbidden,
	1/.style={numcols=1},
	2/.value forbidden,
	2/.style={numcols=2},
	3/.value forbidden,
	3/.style={numcols=3},
	4/.value forbidden,
	4/.style={numcols=4},
	5/.value forbidden,
	5/.style={numcols=5},
	6/.value forbidden,
	6/.style={numcols=6},
	label/.default=Alph,
	label/.code={\@choicelabelingtrue\edef\choicelabel@type{#1}},
	without label/.value forbidden,
    without label/.code={\@choicelabelingfalse},
	checkbox/.value forbidden,
	checkbox/.code={\@checkboxtrue},
	without checkbox/.value forbidden,
	without checkbox/.code={\@checkboxfalse}
}
\newlength{\choicepartsep}%
\newenvironment{multichoice}[1][4]{%
	\edef\choiceparts@opt{#1}%
	\pgfkeys{/multichoice/.cd,numcols=1,label=Alph,checkbox,#1}%
	\setlength{\choicepartsep}{0cm}%
	\def\choicenumcols##1{%
		\def\choicenum@cols{##1}%
		\setlength{\choicepartlength}{\dimexpr \linewidth / \choicenum@cols-\choicepartsep\relax}%
	}%
	\setlength{\choicepartlength}{\dimexpr \linewidth / \choicenum@cols-\choicepartsep\relax}%
	\par%
	\setcounter{choicenumparts}{0}%
	\setcounter{choicenumpart}{0}%
	\setcounter{choicecurpart}{0}%
	\newcommand{\choicepart}[1]{%
		\stepcounter{choicenumparts}%
		\stepcounter{choicenumpart}%
		\stepcounter{choicecurpart}%
		\ifnum\choicenum@cols>1%
			\begin{minipage}[t]{\choicepartlength}%
				\if@choicelabeling\if@RTL\parbox[b]{1.5em}{\hfill\csname\choicelabel@type\endcsname{choicenumpart})}\else\parbox[b]{1.5em}{\hfill(\csname\choicelabel@type\endcsname{choicenumpart}}\fi\fi\ ##1%
			\end{minipage}%
% 			\if@choicelabeling\else\hskip\choicepartsep\fi%
		\else%
			\if@choicelabeling\if@RTL\parbox[b]{1.5em}{\hfill\csname\choicelabel@type\endcsname{choicenumpart})}\else\parbox[b]{1.5em}{\hfill(\csname\choicelabel@type\endcsname{choicenumpart}}\fi\fi\ ##1%
		\fi%
		\ifdim\choiceverticalspace>0pt\vspace{\choiceverticalspace}\fi%
		\ifnum\value{choicecurpart}=\choicenum@cols%
		\setcounter{choicecurpart}{0}\par\else\fi%
	}%
% 	\pgfkeys{/multichoice/.cd,checkbox,#1}%
%	\@checkboxtrue%
	\newcount\chcount%
	\chcount 1\relax%
	\newcommand{\@choice}[2][{}]{%
		\expandafter\gdef\csname choice\the\chcount \endcsname{\choicepart{\if@checkbox\tf[##1]\fi\ ##2}}%
		\advance\chcount 1\relax%
	}%
	\newcommand{\choice}[1]{%
		\@choice{##1}%
	}%
	\newcommand{\truechoice}[1]{%
	\@choice[t]{##1}%
	}%
%     \edef\multichoice@opts{\num@cols,\if@choicelabeling label\else without label\fi}%
% 	\expandafter\parts\expandafter[\multichoice@opts]
	}%
	{%
		\pgfmathsetseed{\@examcode\thenumques\thecurpart}%
		\advance\chcount -1\relax%
		\foreach \x in {1,...,\the\chcount}{%
			\pgfmathsetmacro{\@rand}{random(\x,\the\chcount)}%
			\if@randomchoicesort%
				\csname choice\@rand\endcsname%
				\expandafter\global\expandafter\let\csname choice\@rand\expandafter\endcsname\csname choice\x\endcsname%
			\else%
				\csname choice\x\endcsname%
			\fi%
		}%
	\endparts%
}%
\newenvironment{fourchoice}[1][4]{%
\begin{multichoice}[4,#1]
}
{%
\end{multichoice}
}
\newenvironment{truefalse}[1][1]{%
	\newcommand{\true}[1]{%
		\part{\tf[t] ##1}
	}
	\newcommand{\false}[1]{%
		\part{\tf[f] ##1}
	}
	\newcommand{\prop}[1]{%
		\part{\tf[] ##1}
	}
	\begin{parts}[#1]
	}
	{%
	\end{parts}
}
\long\def\@printforall#1{
	\Fields{\strow}
	\newcounter{i}
	\Merge{\@studentsinfo}{
		\setcounter{i}{1}
		\foreach \col in \strow{%
			\expandafter\xdef\csname strow\the\value{i}  \endcsname{\col}%
			\stepcounter{i}%
		}
		\edef\stnumber{\csname strow1 \endcsname}
		\edef\stfname{\csname strow2 \endcsname}
		\edef\stlname{\csname strow3 \endcsname}
		\edef\stbranch{\csname strow4 \endcsname}
		\edef\stphoto{\csname strow5 \endcsname}
		\studentfirstname{\stfname}
		\studentlastname{\stlname}
		\chairnumber{\stnumber}
		\branch{\stbranch}
		\studentphoto{\stphoto}
		\setcounter{page}{1}
		#1
		\newpage
	}
}
\newcommand\printforall[1][\@nil]{%
	\def\argo{#1}
	\ifx\argo\@nnil\else\studentsinfo{#1}\fi
	\ifx\@onlypreamble\@notprerr
		\ClassError{azmoon}{You must use \string\printforall\ only in preamble}{}
	\fi
	\AfterEndPreamble{\bidi@collect@long@body\@printforall}
}

\ifx\he@dstatus\nohe@d
	\pagestyle{empty}
\else
	\pagestyle{\he@der}
\fi
\AtEndPreamble{
\usepackage{xepersian}
%\settextfont[Scale=.9,BoldFont=Mikhak-Bold.ttf]{Mikhak-Medium.ttf}
%\setdigitfont[Scale=.9,BoldFont=Mikhak-Bold.ttf]{Mikhak-Medium.ttf}
%\setlatintextfont[Scale=.9,BoldFont=Mikhak-Bold.ttf]{Mikhak-Medium.ttf}
\settextfont[Scale=.9,BoldFont=Mikhak-DS1-Bold.ttf]{Mikhak-DS1-Medium.ttf}
\setdigitfont[Scale=.9,BoldFont=Mikhak-DS1-Bold.ttf]{Mikhak-DS1-Medium.ttf}
\setlatintextfont[Scale=.9,BoldFont=Mikhak-DS1-Bold.ttf]{Mikhak-DS1-Medium.ttf}
\linespread{1.5}
\setlength{\parindent}{0cm}
}
\newcommand{\linespacefactor}[1]{%
	\AtEndPreamble{%
		\linespread{#1}%
	}%
}%
\AtEndDocument{%
	\if@filesw%
	\immediate\write\@auxout%
	{\string\global\string\setlength{\string \totalpoint}{\the\sumpoint}}%
	\fi%
}
\newcommand\pvector[1]{%
	\renewcommand{\arraystretch}{.6666}
	\begin{bmatrix}
		#1
	\end{bmatrix}
}
\newcommand\strikeoutup[2][]{%
	\renewcommand{\arraystretch}{.1}
	\begin{tabular}[b]{@{}c@{}} 
		#1\\
		\cancel{#2}
	\end{tabular}
	\renewcommand{\arraystretch}{1}
}
\newcommand\strikeoutdown[2][]{%
	\renewcommand{\arraystretch}{.1}
	\begin{tabular}[t]{@{}c@{}} 
		\cancel{#2}\\
		#1
	\end{tabular}
	\renewcommand{\arraystretch}{1}
}
\newcommand{\strikeout}[2][]{\strikeoutup[#1]{#2}}
