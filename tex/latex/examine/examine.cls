\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{examine}[2017/10/28 version 1.0.0 by Mojtaba Baghban] 
\RequirePackage{translations}
\RequirePackage{lastpage}
\RequirePackage{bidi-atbegshi}
\RequirePackage{tabularx}
\RequirePackage{tikz}
\usetikzlibrary{calc}

\newif\if@rtl
\@rtlfalse

\newcommand{\tf}[1][{}]{\fillin[#1][1.5cm]}
\newcommand\@lang{english}
\newcommand\teacher@title{Teacher}
\newcommand\teacher@name{}
\newcommand\answer@time{}
\newcommand\exam@date{}
\newcommand\@grade{}
\newcommand\@branch{}
\newcommand\@school{}
\newcommand\@city{}
\newcommand\examdate[1]{\renewcommand{\exam@date}{#1}}
\newcommand\grade[1]{\renewcommand{\@grade}{#1}}
\newcommand\branch[1]{\renewcommand{\@branch}{#1}}
\newcommand\school[1]{\renewcommand{\@school}{#1}}
\newcommand\city[1]{\renewcommand{\@city}{#1}}
\newcommand\teacher[1]{\renewcommand{\teacher@name}{#1}}
\newcommand\teachertitle[1]{\renewcommand{\teacher@title}{#1}}
\newcommand\answertime[1]{\renewcommand{\answer@time}{#1}}
\newcommand{\drline}{
	\begin{LTR}
		\vspace{-.5cm}
		\begin{tikzpicture}[overlay,remember picture]
%		\draw [line width=.5pt] ($ (0,0) + (0cm,0) $) -- ($ (\textwidth,0) + (0,0) $);
        \draw (0,0) -- (\textwidth,0);
		\end{tikzpicture}
		\vspace{-0.5cm}
	\end{LTR}
}

\newcommand{\makeborder}{
	\AtBeginShipout{\AtBeginShipoutAddToBox{\make@border}}
}
\newcommand{\makeheadpage}{
%	\AtBeginShipoutFirst{\make@headpage}
	\make@headpage
	\vbox{\vspace{1cm}}
}

\DeclareOption{rtl}{\@rtltrue}
\DeclareOption{Fa}{
	\@rtltrue
	\renewcommand{\@lang}{farsi}
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\LoadClass{exam}
\setlength{\rightpointsmargin}{2cm}

\LoadDictionaryFor{\@lang}{examine}

\renewcommand{\point@sing}{\GetTranslationFor{\@lang}{point}}
\renewcommand{\point@plur}{\GetTranslationFor{\@lang}{points}}
\renewcommand\bonuspoint@sing{\GetTranslationFor{\@lang}{point (bonus)}}
\renewcommand\bonuspoint@plur{\GetTranslationFor{\@lang}{points (bonus)}}
\renewcommand{\solutiontitle}{\noindent\textbf{\GetTranslationFor{\@lang}{Solution}:}\enspace}
\marginbonuspointname{ \GetTranslationFor{\@lang}{(bonus)}}

\renewenvironment{oneparcheckboxes}%
{%
	% Although we're not printing numbers for the choices, we use the
	% choice counter to keep track of whether a choice is the first
	% one (in which case we don't leave any additional space) or a
	% later one (in which case we do leave additional space):    
	\setcounter{choice}{0}%
	\\
	\def\choice{%
		\if@correctchoice \endgroup \fi
		\stepcounter{choice}%
		\ifnum\value{choice}>1\relax
		\hfill
		\fi
		\checkbox@char
		% No need to put the following into a token string; we just put
		% \checkbox@char onto the page, so we're at the spot whose page
		% number we want to record:
		\questionobject@pluspagecheck
		\nobreak\enskip
	}% choice
	\def\CorrectChoice{%
		\if@correctchoice \endgroup \fi
		\stepcounter{choice}%
		\ifprintanswers
		\begingroup \@correctchoicetrue 
		\CorrectChoice@Emphasis
		\fi
		\ifnum\value{choice}>1\relax
		\hfill
		\fi
		\ifprintanswers
		\checked@char
		\else
		\checkbox@char
		\fi
		% No need to put the following into a token string; we just put
		% the choicelabel onto the page, so we're at the spot whose page
		% number we want to record:
		\questionobject@pluspagecheck
		\nobreak\enskip
	}% CorrectChoice
	\let\correctchoice\CorrectChoice
	\let\par\@empty
	% If we're continuing the paragraph containing the question,
	% then leave a bit of space before the first choice:
	\ifvmode\else\enskip\fi
	\ignorespaces
}%
{\if@correctchoice \endgroup \fi}

\newcommand{\make@border}{
	\begin{tikzpicture}[overlay,remember picture]   
	\draw [double distance=1.5pt,color=black,line width=1.5pt,rounded corners=2pt]
	($ (current page.north west) + (1.3cm,-1cm) $)
	rectangle
	($ (current page.south east) + (-1.3cm,1cm) $);   
	%        \node at  ($(current page.south east) - (3cm,-1cm) $) 
	%        [shape=rectangle,rounded corners,fill=white] {\rl{مقداری متن}};
	\node at  ($(current page.south) + (0cm,+1cm) $)
	[shape=rectangle,rounded corners,fill=white] {\rl{نیمسال اول 97-96}};
	\node at  ($(current page.south west) + (3cm,+1cm) $) 
	[shape=rectangle,rounded corners,fill=white] {\rl{صفحه \thepage{} از \pageref{LastPage}}};   
	\end{tikzpicture}
}
\newcommand{\make@headpage}{
	\parbox{.25\textwidth}{
		\textbf{\GetTranslationFor{\@lang}{First and Last Name}:}
%		\dotfisll
		\\[10pt]
		\textbf{\@school}
		\\[10pt]
		\textbf{\GetTranslationFor{\@lang}{grade} \@grade\ \GetTranslationFor{\@lang}{branch} \@branch\ }	
	}
	\parbox{.50\textwidth}{\centering
		\textbf{اداره آموزش و پرورش شهرستان \@city}
		\\[10pt]
		\textbf{ارزشیابی پایانی نوبت اول}
		\\[10pt]
		\textbf{درس ریاضی}
	}
	\parbox{.25\textwidth}{
		\textbf{تاریخ ارزشیابی: \exam@date}
		\\[10pt]
		\textbf{زمان پاسخگویی: \answer@time}
		\\[10pt]
		\textbf{\numquestions\ سوال در \numpages\ صفحه}
	}
\vspace{.2cm}
\drline
\vspace{.7cm}
\parbox{.12\textwidth}{\textbf{نمره:}}
\parbox{.16\textwidth}{\textbf{رتبه در کلاس:}}
\parbox{.36\textwidth}{\textbf{نظر دبیر:}}
\parbox{.36\textwidth}{\textbf{نظر سرپرست دانش‌آموز:}}
\drline
\vspace{-1.05cm}
%    	\begin{tikzpicture}[overlay,remember picture]
%    	\draw [line width=.5pt] ($ (0,0) + (0cm,0) $) -- ($ (0,0) + (\textwidth,0) $);
%    	\end{tikzpicture}
%\vspace{-1.3cm}
}

\newcommand{\groupques}[1]
{
	\drline
	\vspace{-.25cm}
	\uplevel{
		\centering
		\textbf{#1}
	}
	\vspace{-.25cm}
	\drline
}
\def\@fillin@relay[#1]{%
	% The first argument is in \fillin@ans, the second is #1.
	\leavevmode
	\ifprintanswers
	\rlap{\raise -\answerclearance \hbox to #1{\hrulefill}}%
	\begingroup
	\setbox0 \hbox{\color@begingroup
		\CorrectChoice@Emphasis \fillin@ans \color@endgroup}%
	\ifdim\wd0 > #1\relax
	\hbox{\CorrectChoice@Emphasis \fillin@ans}%
	\else
	\hbox to #1{\CorrectChoice@Emphasis \hfil \fillin@ans \hfil}%
	\fi
	\endgroup
	\else
	\raise -\answerclearance \hbox to #1{\hrulefill}%
	\fi
}% @fillin@relay
\newcommand{\fillincircle}[1]
{
	\begin{tikzpicture}[baseline={([yshift=-.9ex]current bounding box.center)}]
	\draw (0,0) circle (.3cm) node[pos=.5] {\fillin[#1][0cm]};
	\end{tikzpicture}
}
\newcommand{\fillinsquare}[1]
{
	\begin{tikzpicture}[baseline={([yshift=-.9ex]current bounding box.center)}]
	\draw (0,.35) rectangle (.5,-.15) node[pos=.5] {\fillin[#1][0cm]};
	\end{tikzpicture}
	\hspace{.4cm}
}
\newcommand{\answer}[1]
{
	\ifprintanswers
	#1
	\fi
}
