for %%f in (gost7*.tex) do pdflatex -quiet %%f 
for %%f in (gost200*.tex) do pdflatex -quiet %%f 

REM pause
for %%f in (gost*.aux) do bibtex8 -B -c cp1251.csf %%f 

REM pause
for %%f in (gost7*.tex) do pdflatex %%f 
for %%f in (gost200*.tex) do pdflatex %%f 
for %%f in (gost2008-nat*.tex) do pdflatex %%f 
for %%f in (gost2008-sort*.tex) do pdflatex %%f 

del *.aux *.out *.toc *.brf .pdf
del *.bbl 
REM del *.blg 
del *.log
