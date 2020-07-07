# Some tips and help

# Table of Content:

1. [Filetype](#help-filetypes)
	1. [C language](#help-c-c-language)
	1. [Python](#help-py-python)
	1. [LaTeX](#help-tex-latex)
	1. [Visual Basic](#help-vbs-visual-basic-script)
	1. [Vim](#help-vim-vim)
	1. [Markdown](#help-markdown)
2. [Programs](#help-programs)
	1. [Pandoc](#help-pandoc)
	1. [TotalCommander](#help-totalcommander)
	1. [SumatraPDF](#help-sumatrapdf)

_______________________________________________________________________________

_______________________________________________________________________________

HELP: filetypes
===============================================================================
[Table of Content](#table-of-content)

## HELP: c C language
[Table of Content](#table-of-content)

_______________________________________________________________________________

## HELP: py Python
[Table of Content](#table-of-content)

_______________________________________________________________________________

## HELP: tex LaTeX
[Table of Content](#table-of-content)

### MustHave strings in file:

```latex
\documentclass[12pt, a4paper, oneside]{report}	% {article|letter|report}
\usepackage[utf8]{inputenc}
\usepackage[T1, T2A]{fontenc}
\usepackage[english, russian]{babel}
```

### Page properties

```latex
\usepackage{geometry}
\geometry
{
	a4paper,
	left=20mm,
	right=20mm,
	top=25mm,
	bottom=20mm,
	headheight=10pt,
	footskip=20pt
}
```

 *or*

```latex
\textheight=28cm			% высота текста A4
\textwidth=16cm				% ширина текста A4
\oddsidemargin=0pt			% отступ от левого края
\topmargin=0cm			% отступ от верхнего края

\parindent=0pt				% абзацный отступ
\parskip=0pt				% интервал между абзацами
\tolerance=2000				% терпимость к "жидким" строкам
\flushbottom				% выравнивание высоты страниц
\setcounter{secnumdepth}{0}	% секции без нумерации
```

### Footer and header


```latex
\usepackage{fancybox, fancyhdr}
```

__For first page__

```latex
\fancypagestyle{firststyle} %новый стиль
{
	\fancyfootoffset[R]{-12cm} %так можно регулировать ширину колонтитула
	% ...
	\renewcommand{\footrulewidth}{0.3 mm} %толщина отделяющей полоски снизу
	\renewcommand{\headrulewidth}{0.3 mm} %толщина отделяющей полоски сверху
}

\begin{document}
\thispagestyle{firststyle}
```

*Example*

```latex
\pagestyle{fancy}
\fancyhead[L]{{\small Подготовлено для Игната, 08.04.20}}
\fancyhead[R]{{\small denisov0gleb@gmail.com}}

%\fancyhead{} % Clear the header

%E: Even page (чётная страница)
%O: Odd page (нечётная страница)
%L: Left field (левое поле)
%C: Center field (центральное поле)
%R: Right field  (правое поле)
%H: Header  (верхний колонтитул)
%F: Footer   (нижний колонтитул)
\fancyhead[*]{}
\fancyfoot[*]{}

\fancyfoot[C]{-~\thepage~-}

% Delete the line of header/footer
\renewcommand{\headrulewidth}{0pt}
```

### Styles
```latex
% italic
\textit{italic}

% special
\emph{special}

% Capital
\textsc{capital}

% bold
\textbf{bold}

% cross out words
\usepackage{ulem}
\sout{Wrong.} Correct.

% colored text
\usepackage{xcolor}
\textcolor{red}{red text}

% Correction on 
\marginpar{Этот текст появится сбоку на полях.}

{\large text}

%or

\begin{large}
	some text
\end{large}

% text in color box
\newcommand\marker[2]{{\fboxsep=0pt\colorbox{#1}{\strut #2}}}
\marker[red]{text}

%or simply but with additional spaces

\colorbox{red!50}{ugly text}
```

### Math

```latex
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage[warn]{mathtext}

% In-text equation:
$ ... $

% Centered equation:
$$ ... $$

% Equations
\begin{equation}
	%...
\end{equation}

%Russian text in the equation
\text{}

\begin{eqnarray}
	%long string of equation
	%or many lines
\end{eqnarray}

%Systems
$\begin{cases}
	4x + 3y = 6\\
	6x - 5y + 29= 0
\end{cases}$
```

### Symbols

```latex
\usepackage{amsfonts}
\usepackage{amssymb}

% Grad symbol:
^\circ

%MxN:
\times

%Brackets
(\big (\Big (\bigg (\Bigg

% № in russian text:
\usepackage{textcomp}

\newcommand*{\No}{\textnumero}

\No

% /
{\slash}

% ...
\ldots

% +-
\pm
```

[Detect the hand written symbol](http://detexify.kirelabs.org/classify.html)

### References

```latex
\usepackage{hyperref}

\label{name}

% References
\ref{name}

% Turn the hyperlink off:
% after \begin{document}
\makeatletter
\let\ref\@refstar
\makeatother
```

### Graphics

```latex
\usepackage{graphicx}

\includegraphics{screenshot.png}
```

### Enumerate symbols

```latex
\usepackage{enumerate}

% 1. 2. etc.
\begin{enumerate}[1.]

% 1) 2) etc.
\begin{enumerate}[1)]

% or

\usepackage{enumitem}

% 1) 2) etc.
\begin{enumerate}[label=\arabic*)]

% a) b) etc.
\begin{enumerate}[label=\alph*)]


%start counter from 20
\setcounter{enumi}{19}
```

### Sections

```latex
\part{part}
\chapter{chapter}
\section{section}
\subsection{subsection}
\subsubsection{subsubsection}
\paragraph{paragraph}
\subparagraph{subparagraph}
```

### Numerate pages

```latex
% Format {\No of Chapter - \No of page}
\usepackage[auto]{chappg}
```

### Epigraphes

```latex
\usepackage{epigraph}
\epigraph{\textit{The greatest difficulties lie where we are not looking for them.}}
{-- Johann Wolfgang von Goethe}
```


### Table Content

```latex
\renewcommand\contentsname{Оглавление} %%% renaming the Table of Contents

%arabic|alpha|roman
\renewcommand{\thechapter}{\arabic{chapter}.} %Add point after Section
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}.}
```

### Tables

```latex
%\usepackage{longtable} %for multipage tables
%longtable instead of table
%h < h! < H
%pH - on new page
%th - on top of page
%bh - on bottom of page
\begin{table}[h]\caption{Name of table}\label{name}
	\begin{tabular}{|r|c{0.7\linewidth}|l|} % 70\% of page width
		1 & 2 3 \\

		% Union of two columns
		\multicolumn{2}{|c|}{Результаты измерений} & 3 \\
		\multirow{}{}
	\end{tabular}
\end{table}


% Line between rows
\hline

% Line in the rows
\cline{fromRow-tillRow}


%Additional vertical space
\\[1cm]


% Rotate on 90 degrees
\rotate{90}{smt}
```


### Tikz diagrams

```latex
\usepackage{tikz}
\usetikzlibrary{positioning,arrows}
```

*example:*
```latex
\newcommand{\ArrowL}{2,0}
\begin{tikzpicture} [thick, node distance=2cm, text height=1.5ex, text depth=.25ex, auto]
	\node (Ca) {\ce{Ca}};
	\node[right of=Ca] (CaO) {\ce{CaO}};
	\node[right of=CaO] (CaOH)  {\ce{Ca(OH)2}};
	\node[right of=CaOH]  (CaSO) {\ce{CaSO4}};

	\node[below of=Ca] (CaS) {\ce{CaS}};

	\path[->] (Ca) edge (CaO);
	\path[->] (CaO) edge (CaOH);
	\path[->] (CaOH) edge (CaSO);
	\path[->] (Ca) edge (CaS);
	\path[->] (CaO) edge (CaS);
	\path[->] (CaOH.240) edge (CaS.-1);
	\path[<-] (CaOH) edge (CaS);

\end{tikzpicture}
```


### Chemistry chemfig

```latex
\usepackage{chemfig}

%\chemfig{<atom1><bond type>[<angle>,<coeff>,<tikz code>]<atom2>}
% coeff - the coefficient for multiplying the bond length

%Angles are counterclockwise:
% 0 = 0
% 1 = 45
% 2 = 90
% 3 = 135
% 4 = 180
% 5 = 225
% 6 = 270
% 7 = 315

% Bonds
%\chemfig{A-B} - single
%\chemfig{A=B} - double
%\chemfig{A~B} - triple
%\chemfig{A>B} - black from left to right
%\chemfig{A<B} - black from right to left
%\chemfig{A>:B} - pipes
%\chemfig{A<:B} - pipes
%\chemfig{A>|B} - white
%\chemfig{A<|B} - white

\chemfig{A-[1]B-[7]C}

% Ring
\chemfig{A*6(-B-C-D-E-F-)}
\chemfig{*6(=-=-=-)}
\chemfig{**5(------)}

% Opened ring
\chemfig{A*5(-B=C-D)}

% Ion
%^{-}
%^{\ominus}
```

### Chemistry mhchem

```latex
\usepackage[version=4]{mhchem}
%\ce{something}

\ce{SO4^2-}
\ce{NO3-}
\ce{AgCl2-}
\ce{^{227}_{90}Th+}
\ce{[AgCl2]-}
\ce{RNO2^{-.}}
\ce{$\mu\hyphen$Cl}

%- - single bond
%= - double bond
%# - triple bond (\bond{#})
% or
\ce{A\sbond B\dbond C\tbond D}

% v => arrow down
% ^ => arrow up
% -> => arrow right
% <- => arrow left
% <=> => double side arrow
% <-> => double side arrow from one line
% ->[\alpha][\beta] => \a upon the arrow \b down the arrow
% ->T[text]
% ->C[chemical]

% * or . => \cdot
```

_______________________________________________________________________________

## HELP: vbs Visual Basic Script
[Table of Content](#table-of-content)

```vbs
' How execute:
' converter.vbs полный_путь_к_файлу\имя_файла.docx полный_путь_куда_сохранить\имя_файла_без_расширения

' Wscript.Arguments.Item(0) — полный_путь_к_файлу\имя_файла.docx
' WScript.Arguments.Item(1) — полный_путь_сохранения\имя_файла_без_расширения

' Saving types:
' 0 .doc
' 2 .txt
' 6 .rtf
' 7 .txt in unicode
' 8 .html
' 16 default: .docx
' 17 .pdf

Const wdFormatText = 2

' Open Word
Set objWord = CreateObject("Word.Application")

' Add this to see the opening process
objWord.Visible = TRUE

' Instead of "try catch"
On Error Resume Next

' Open twice to ignore some errors
Set objDoc = objWord.Documents.Open(Wscript.Arguments.Item(0), True)
Set objDoc = objWord.Documents.Open(Wscript.Arguments.Item(0), True)

objDoc.SaveAs WScript.Arguments.Item(1), wdFormatText
objWord.Quit


' For Open/LibreOffice:
' ext = 'html'
' os.chdir(oo_path)
' try:
    ' subprocess.check_call(oo_executable + ' --headless --convert-to ' + ext + ' --outdir ' + destPath + ' ' + srcFile, shell=True)
' except subprocess.CalledProcessError as e:
    ' print(e.output)
```

_______________________________________________________________________________

## HELP: vim Vim
[Table of Content](#table-of-content)


### Insert mode

```vim
Ctrl-h -- backspace
Ctrl-w -- delete back one word
Ctrl-u -- delete back this line to the start
Ctrl-[ -- Escape
Ctrl-o -- Normal mode in Insert mode
Ctrl-r[number] -- Past the yanked text from buffer [number]
Ctrl-r= [math] -- Use Vim calculator and insert it to the text after <Enter>
Ctrl-v u#### -- insert special symbol by Unicode
Ctrl-k {char1}{char2} -- insert digraph or the symbol
					-- << -> «
					-- 12 -> ½ (1/2)
					:h digraph-table
Ctrl-x Ctrl-f -- autoinsert file names from current directory
Ctrl-x Ctrl-k -- word from dictionary
Ctrl-v u####	-- insert Unicode symbol
```

### Normal Mode

```vim
ga -- show the information about symbol
]s -- next spelling error
[s -- previous spelling error
zg -- add the word under cursor to the dictionary
zug -- undo zg command
z= -- print list of possible variants
zo -- open foldings
zc -- close foldings
```

### Command Mode

```vim
Ctrl-w -- delete one word back
Ctrl-u -- delete one line back
Ctrl/Shift-Left/Right -- move one word ->/<-
Ctrl-B -- Home
Ctrl-E -- End
Tab/Ctrl-P -- automatch forward / backward
Ctrl-D -- list of matches

Ctrl-r[number] -- insert from register [number]
Ctrl-k -- insert special symbols
Ctrl-r Ctrl-w -- insert word under cursor
:[number]p -- print line [number]
			-- % -- all
			-- $ -- last line
			-- . -- current line
```

### Info

```vim
Ctrl-G -- file name, cursor position, file status
```

### Windows

```vim
Ctrl-w +/- -- increase / decrease the window size
[number] Ctrl-w +/- -- increase / decrease window height

Ctrl-w + H/J/K/L -- move splitted window
```

### Sessions

```vim
:mksession session1.vim -- create session
:mksession! session1.vim -- save session
:source session1.vim -- restore that session
	or
vim -S session1
```

### Browser

```vim
:e .
	or
:Lex

- -- move to the parent directory
```

_______________________________________________________________________________

## HELP: markdown
[Table of Content](#table-of-content)


### HEADERS

```md
# H1
## H2
### H3
#### H4
##### H5
###### H6
```

*or*

```md
Header 1
========

Header 2
--------
```

### STYLES


```md
*italic*
	or
_italic_
```

```md
**bold**
	or
__bold__
```

```md
**_bold and italic_**

~~Scratched~~

<div align="center">
  centered text
</div>

<span style="color:blue">Blue text</span>
```

### LIST

```md
1. Fisrt
2. Second
  * Unordered sublist with two spaces
4. Three

   The blank line to make paragraph in item

   Have to have at least one space before

5. Another way to create a paragraph:  
   Leave two spaces at the line end.

* First unordered type
- Second unordered
+ Third unordered
```

### LINKS

```md
[I'm an inline-style link](https://www.google.com)

[I'm an inline-style link with title](https://www.google.com "Google's Homepage")

[I'm a reference-style link][Arbitrary case-insensitive reference text]

[I'm a relative reference to a repository file](../blob/master/LICENSE)

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself].

URLs and URLs in angle brackets will automatically get turned into links.
http://www.example.com or <http://www.example.com> and sometimes 
example.com (but not on Github, for example).

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org
[1]: http://slashdot.org
[link text itself]: http://www.reddit.com
```

### HIGHLIGHT

`inline code`

```python
s = "Python syntax highlighting"
print s
```

```
No language make cause no highlight
```

	*or*

    Use 4 spaces indent for
    code highlighting.
    It is a bad decision.


### TABLES

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |


### BLOCKQUOTES

> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.


### INLINE HTML

<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>

### HORIZONTAL RULES

Three or more:

---
	or
***
	or
___


### Footnotes

Not working???

```md
Here's a simple footnote,[^1] and here's a longer one.[^bignote]

[^1]: This is the first footnote.

[^bignote]: Here's one with multiple paragraphs and code.

    Indent paragraphs to include them in the footnote.

    `{ my code }`

    Add as many paragraphs as you like.
```

### Task list
```md
- [ ] Not done yet
- [x] Already done
```

_______________________________________________________________________________

_______________________________________________________________________________

HELP: programs
===============================================================================
[Table of Content](#table-of-content)

## HELP: pandoc
[Table of Content](#table-of-content)

*Example:*

```pandoc
pandoc test1.md -f markdown -t html -s -o test1.html
```


Options:

-f/--from=						-- convert from *type*

-t/--to=							-- convert to *type*

-s										-- standalone file

-o/--output=					-- output file name

--data-dir=						-- the file containing directory

--template=						-- template.extension file.
												If not found, search in *templates* subdir

-N/--number-sections	-- number sections in LaTeX, HTML, EPUB

--reference-doc=			-- reference for docx file


Can determine filetype automatically from filename extension.

List of *from* types:
- commonmark (CommonMark Markdown)
- creole (Creole 1.0)
- csv (CSV table)
- docbook (DocBook)
- docx (Word docx)
- dokuwiki (DokuWiki markup)
- epub (EPUB)
- fb2 (FictionBook2 e-book)
- gfm (GitHub-Flavored Markdown), or the deprecated and less accurate markdown_github; use markdown_github only if you need extensions not supported in gfm.
- haddock (Haddock markup)
- html (HTML)
- ipynb (Jupyter notebook)
- jats (JATS XML)
- jira (Jira wiki markup)
- json (JSON version of native AST)
- latex (LaTeX)
- markdown (Pandoc’s Markdown)
- markdown_mmd (MultiMarkdown)
- markdown_phpextra (PHP Markdown Extra)
- markdown_strict (original unextended Markdown)
- mediawiki (MediaWiki markup)
- man (roff man)
- muse (Muse)
- native (native Haskell)
- odt (ODT)
- opml (OPML)
- org (Emacs Org mode)
- rst (reStructuredText)
- t2t (txt2tags)
- textile (Textile)
- tikiwiki (TikiWiki markup)
- twiki (TWiki markup)
- vimwiki (Vimwiki)


List of *to* types:
- asciidoc (AsciiDoc) or asciidoctor (AsciiDoctor)
- beamer (LaTeX beamer slide show)
- commonmark (CommonMark Markdown)
- context (ConTeXt)
- docbook or docbook4 (DocBook 4)
- docbook5 (DocBook 5)
- docx (Word docx)
- dokuwiki (DokuWiki markup)
- epub or epub3 (EPUB v3 book)
- epub2 (EPUB v2)
- fb2 (FictionBook2 e-book)
- gfm (GitHub-Flavored Markdown), or the deprecated and less accurate markdown_github; use markdown_github only if you need extensions not supported in gfm.
- haddock (Haddock markup)
- html or html5 (HTML, i.e. HTML5/XHTML polyglot markup)
- html4 (XHTML 1.0 Transitional)
- icml (InDesign ICML)
- ipynb (Jupyter notebook)
- jats_archiving (JATS XML, Archiving and Interchange Tag Set)
- jats_articleauthoring (JATS XML, Article Authoring Tag Set)
- jats_publishing (JATS XML, Journal Publishing Tag Set)
- jats (alias for jats_archiving)
- jira (Jira wiki markup)
- json (JSON version of native AST)
- latex (LaTeX)
- man (roff man)
- markdown (Pandoc’s Markdown)
- markdown_mmd (MultiMarkdown)
- markdown_phpextra (PHP Markdown Extra)
- markdown_strict (original unextended Markdown)
- mediawiki (MediaWiki markup)
- ms (roff ms)
- muse (Muse),
- native (native Haskell),
- odt (OpenOffice text document)
- opml (OPML)
- opendocument (OpenDocument)
- org (Emacs Org mode)
- pdf (PDF)
- plain (plain text),
- pptx (PowerPoint slide show)
- rst (reStructuredText)
- rtf (Rich Text Format)
- texinfo (GNU Texinfo)
- textile (Textile)
- slideous (Slideous HTML and JavaScript slide show)
- slidy (Slidy HTML and JavaScript slide show)
- dzslides (DZSlides HTML5 + JavaScript slide show),
- revealjs (reveal.js HTML5 + JavaScript slide show)
- s5 (S5 HTML and JavaScript slide show)
- tei (TEI Simple)
- xwiki (XWiki markup)
- zimwiki (ZimWiki markup)
- the path of a custom Lua writer, see Custom writers below

_______________________________________________________________________________

## HELP: TotalCommander
[Table of Content](#table-of-content)

### Archives

Ctrl + PgDn -- open file as archive (.docx, .epub, etc)

word -> media -- all images


_______________________________________________________________________________

## HELP: SumatraPDF
[Table of Content](#table-of-content)

Read files:

- PDF (.pdf)
- eBook formats:
    - unencrypted EPUB (.epub)
    - MOBI (.mobi and un-encrypted .azw)
    - Fiction Wise (.fb2, .fb2z, .zfb2)
    - .pdb (Palm DOC format)
    - .tcr
- comic book files: .cbz, .cbr, .cbt, .cb7z
- archive files (.7z, .rar, .tar, .zip) with images
- DjVu (.djv, .djvu)
- Microsoft Compiled HTML Html (.chm)
- XPS (.xps, .oxps, .xod)
- images (.jpg, .png,.gif, .webp, .tiff, tga, .j2k, .bmp, .dib)
