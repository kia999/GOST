for %%f in (gost7*.tex) do pdflatex %%f
REM pause
for %%f in (gost7*.aux) do bibtex8 -B -c koi8u.csf %%f
REM pause
for %%f in (gost7*.tex) do pdflatex %%f
del *.aux *.out *.toc *.brf *.log .pdf
del *.bbl *.blg
