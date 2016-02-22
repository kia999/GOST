for %%f in (ugost2008-natbib*.tex) do pdflatex -quiet %%f 

REM pause
for %%f in (ugost2008-natbib*.aux) do bibtex8 -B -c utf8cyrillic.csf %%f 

REM pause
for %%f in (ugost2008-natbib*.tex) do pdflatex %%f 
for %%f in (ugost2008-natbib*.tex) do pdflatex %%f 

del *.aux *.out *.toc *.brf .pdf
REM del *.bbl 
REM del *.blg 
del *.log
