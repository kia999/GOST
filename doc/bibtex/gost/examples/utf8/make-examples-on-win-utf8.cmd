rename .\bib\examples.bib examples.bak
REM pause
copy .\bib\ex*.bib .\bib\examples.bib
REM pause
if not exist bibnocap.sty copy .\..\..\..\..\..\tex\latex\gost\bibnocap.sty .\bibnocap.sty
for %%f in (ugost7*.tex) do pdflatex -quiet %%f 
for %%f in (ugost200*.tex) do pdflatex -quiet %%f 

REM pause
for %%f in (ugost*.aux) do bibtex8 -B -c utf8cyrillic.csf %%f 

REM pause
for %%f in (ugost7*.tex) do pdflatex %%f 
for %%f in (ugost200*.tex) do pdflatex %%f 
for %%f in (ugost2008-nat*.tex) do pdflatex %%f 
for %%f in (ugost2008-sort*.tex) do pdflatex %%f 

del *.aux *.out *.toc *.brf .pdf
del *.bbl 
del *.blg 
del *.log
if exist bibnocap.sty del bibnocap.sty
