\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{labreport}[2026/08/21 Custom Lab Report Class with Dynamic Fonts and Grey Lines]

% ==========================================
%           OPTION PROCESSING
% ==========================================
% Forward any base font size (10pt, 11pt, 12pt) to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Load Base Class (inherits font size from user input)
\LoadClass[a4paper]{article} 

% ==========================================
%           REQUIRED PACKAGES
% ==========================================
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\geometry{margin=1in}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage{xcolor} % Required for the grey line
\RequirePackage{multicol}
\RequirePackage{float}
\RequirePackage{listing}

\setlength{\parindent}{0pt}


\lstset{
    frame=tb, % Adds a frame at the top and bottom
    language=C, % Sets default language
    keywordstyle=\color{blue}, % Style for keywords
    basicstyle=\ttfamily, % Use monospaced font
    breaklines=true, % Automatically wrap long lines
    numbers=left % Add line numbers on the left
}

% ==========================================
%           CUSTOM COMMANDS
% ==========================================
% Command to print a sleek grey separator line
\newcommand{\blackline}{
    \vspace{0.2em}
    \noindent\textcolor{black}{\rule{\linewidth}{1pt}}\par
    \vspace{0.5em}
}

\newcommand{\greyline}{
    \vspace{0.2em}
    \noindent\textcolor{gray}{\rule{\linewidth}{0.5pt}}\par
    \vspace{0.5em}
}

% Image Placeholder (dotted-line box effect)
\newcommand{\placeholderbox}[2]{
    \begin{figure}[h]
        \centering
        \framebox[\textwidth]{\parbox{\textwidth}{\centering \vspace{3cm} \textbf{#1} \\ #2 \vspace{3cm}}}
    \end{figure}
}

% ==========================================
%           HEADER VARIABLES & COMMAND
% ==========================================
\newcommand{\@labnum}{}
\newcommand{\labnum}[1]{\renewcommand{\@labnum}{#1}}

\newcommand{\@tablenum}{}
\newcommand{\tablenum}[1]{\renewcommand{\@tablenum}{#1}}

\newcommand{\@labroomnum}{}
\newcommand{\labroomnum}[1]{\renewcommand{\@labroomnum}{#1}}

\newcommand{\@studentoneName}{}
\newcommand{\@studentoneRoll}{}
\newcommand{\studentone}[2]{\renewcommand{\@studentoneName}{#1}\renewcommand{\@studentoneRoll}{#2}}

\newcommand{\@studenttwoName}{}
\newcommand{\@studenttwoRoll}{}
\newcommand{\studenttwo}[2]{\renewcommand{\@studenttwoName}{#1}\renewcommand{\@studenttwoRoll}{#2}}

\newcommand{\@reportdate}{}
\newcommand{\reportdate}[1]{\renewcommand{\@reportdate}{#1}}

\newcommand{\makepair}[4]{
    \begin{multicols}{2}
    \noindent
    \textbf{#1:} #2 \\
    %\hfill
    \textbf{#3:} #4
    \\
    \end{multicols}
}

\newcommand{\makeheader}{
    \title{Lab - \@labnum}
    
    \noindent

    \begin{center}
        {\huge\bfseries \@title} \\[0.3cm]   % Prints the title
    \end{center}
    
    \noindent
    \renewcommand{\arraystretch}{1.2}

    \begin{tabular}{@{}p{0.5\linewidth} p{0.5\linewidth}@{}}
        \textbf{Table Number:} \@tablenum & \textbf{LabRoomNum:} \@labroomnum \\[1em]
        
        \textbf{Student 1:} \@studentoneName & \textbf{Roll Number:} \@studentoneRoll\\[1em] 
        \textbf{Student 1:} \@studenttwoName & \textbf{Roll Number:} \@studenttwoRoll\\[1em]
        \textbf{Date:} \@reportdate & \\
    \end{tabular}

    \par\addvspace{1.5em}
    \blackline
}

% ==========================================
%      LOW-LEVEL SECTION DEFINITIONS
% ==========================================

\newcommand{\makeexperiment}[2]{
    \normalfont

    \begin{center}
        {\Large \bfseries Experiment #1}\\
        {\color{gray}#2}
    \end{center}
}
\def\endexperiment{\par\addvspace{1.5em}}

\newcommand{\makeheading}[1]{
    \bgroup
        \par\addvspace{1.5em}
        \noindent\large\textbf{#1}\par
        \greyline % Automatically inserts the grey line under the title
    \egroup
}

% --- AIM SECTION ---
\def\labaim{
    \normalfont

   \makeheading{Aim} 
}
\def\endlabaim{\par\addvspace{1.5em}}

% --- COMPONENTS SECTION ---
\def\labcomponents{
    \normalfont
    \makeheading{Components}
    \normalsize\scshape
}
\def\endlabcomponents{\par\addvspace{1.5em}}

% --- PROCEDURE SECTION ---
\def\labprocedure{
    \normalfont
    \makeheading{Procedure}
    \normalsize\rmfamily
}
\def\endlabprocedure{\par\addvspace{1.5em}}

% --- OBSERVATION SECTION ---
\def\labobservation{
    \normalfont
    \makeheading{Observations}
    \normalsize
}
\def\endlabobservation{\par\addvspace{1.5em}}


\newcommand{\labpics}[2]{
    \normalfont
    \makeheading{Pictures}
    \normalsize\scshape
    {\par\addvspace{1.5em}}
    \begin{figure}[H]
        \centering
        % Limits the image width to 80% of the page width so it doesn't overflow
        \includegraphics[width=0.8\linewidth]{#1}
        \vspace{0.5em}
        \caption{#2}
    \end{figure}
}

\newcommand{\maketklink}[3]{
    \normalfont
    \makeheading{Simulation Link (TinkerCAD)}
    \normalsize\scshape
    \url{#1}\\

    {\par\addvspace{1.5em}}

    \makeheading{TinkerCAD Screenshot}
    \begin{figure}[H]
        \centering
        % Limits the image width to 80% of the page width so it doesn't overflow
        \includegraphics[width=0.8\linewidth]{#2}
        \vspace{0.5em}
        \caption{#3}
    \end{figure}
}

