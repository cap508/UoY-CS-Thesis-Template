% This file defines a thesis class for
% the University of York. The class 
% complied with the York Regulation 2.7
% in 2000.
%
% Written by J H Pickering, based on
% the UWA thesis class by R Huss 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yorkThesis}

\typeout{York Thesis style by J Pickering 2000}

\LoadClass[11pt,titlepage,openany,oneside]{book}
\usepackage{geometry}
\RequirePackage{ifthen}
\RequirePackage{setspace}

\usepackage{emptypage}

% Do we want lists of figures and tables? By default, yes.
\newboolean{@wantlistoffigures}
\setboolean{@wantlistoffigures}{true}
\newboolean{@wantlistoftables}
\setboolean{@wantlistoftables}{true}

\DeclareOption{nolof}{\setboolean{@wantlistoffigures}{false}}
\DeclareOption{nolot}{\setboolean{@wantlistoftables}{false}}

\ProcessOptions

% Set parameters for floats

\setcounter{totalnumber}{10}               % Pretty unlikely
\renewcommand{\topfraction}{0.85}          % Floats may occupy up to 85%
\renewcommand{\bottomfraction}{0.85}       %  of the page. This is slightly
\renewcommand{\textfraction}{0.15}         %  different to the old style
\renewcommand{\floatpagefraction}{0.60}    % Can allow quite a lot of whitespace on a float page

\setlength{\textheight}{230mm}
\setlength{\oddsidemargin}{14mm}
\setlength{\textwidth}{154mm}

% Call it what you like York regs distinguish
% between a list of Refs and a bibliography
% of not necessarily referenced material 
\renewcommand{\bibname}{List of References}

% Comeply with York regs 2.7.3.j & 2.7.3.l
\setcounter{secnumdepth}{4}
\pagenumbering{arabic}
 
% Macros to define department, supervisor and submission date

\def\dept#1{\gdef\@dept{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}

  \def\@title{}
  \def\@author{}
  \def\@dept{}
  \def\@supervisor{}
  \def\@submitdate{\ifcase\the\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space \number\the\year}

% Generate title page
\newcommand{\titlePage}{
	\begin{singlespace}
	\thispagestyle{empty}%
	\ \vspace{1in}%
	\begin{center}
		{\Huge\expandafter{\bf \@title}\par}
	\end{center}
        \vspace{0.75in}
	\begin{center}
		{\Huge\bf \@author} \\
        \vspace{1in}
        
        \begin{center}
        \begin{minipage}{5in}
         \begin{center}
          This thesis is submitted in partial fulfilment of the\\
          requirements for the degree of\\
          Doctor of Philosophy.
         \end{center}
        \end{minipage}
        \end{center}

        \vspace{0.5in}
          University of York \\
          York\\
          YO10 5DD\\
          UK \\
        \vspace{0.5in}
         \@dept \\
        \vspace{0.25in}
         \@submitdate
	\end{center}
        \end{singlespace}
}

%generate the corrections page
\newcommand{\correctionsPage}{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{CORRECTIONS}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge\textbf{Corrections}}
	\end{flushleft}
	\vspace{20\p@}
}



\newcommand{\contents}{
	\tableofcontents
	\newpage
  \ifthenelse{\boolean{@wantlistoftables}}{
	  \listoftables
  }{}
  \ifthenelse{\boolean{@wantlistoffigures}}{
	  \listoffigures
	  \newpage
  }{}
}

\newcommand{\accompanyingMaterials}{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{ACCOMPANYING MATERIALS}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge\textbf{Accompanying Materials}}
	\end{flushleft}
	\vspace{20\p@}
}

\newcommand{\preface}[1]{
	\newpage
	\markright{}
	\ \vspace{1.0in}
	\begin{center}
	  #1
	\end{center}
}


\newcommand{\afterPreface}[1]{
	\newpage
	\markright{}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge \textbf{Acknowedgments}}
	\end{flushleft}
	\vspace{20\p@}
	#1
	\vspace{59\p@}
	\declaration
}

\newcommand{\yorkBib}[1]{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{BIBLIOGRAPHY}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\huge \textbf{Bibliography}}
	\end{flushleft}
	\vspace{20\p@}
	The following is a list of material that is related to the 
        subject of this thesis but was not directly referanced.
	\input{#1}
}

\newcommand{\definitions}{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{DEFINITIONS}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge \textbf{Definitions}}
	\end{flushleft}
	\vspace{20\p@}
	This section contains Definitions of any terms specific
        to the thesis, including abbreviations and codes used 
        in illustrations.\\
}

\newcommand{\yorkGlossary}{
	\newpage
	\thispagestyle{plain}
	\pagestyle{myheadings}
	\markright{GLOSSARY}
	\ \vspace{59\p@}
	\begin{flushleft}
	  {\Huge \textbf{Glossary}}
	\end{flushleft}
	\vspace{20\p@}
        Terms that require explanation are defined in this section, 
        including a key to any abbreviations used.\\
}

\newcommand{\yorkIndex}{
	\thispagestyle{plain}
        \pagestyle{myheadings}
	\markright{INDEX}
        \printindex
}



