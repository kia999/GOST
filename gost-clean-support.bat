REM Cleaning
del *.aux *.idx *.log *.ilg *.out
del *.ind *.glo *.gls *.idx
del *.blg *.bbl *.bak
cd /d "%~dp0source\bibtex\gost\"
del /S *.aux *.idx *.log *.ilg *.out
del /S *.ind *.glo *.gls *.idx
del /S *.blg *.bbl *.bak
cd /d "%~dp0doc\bibtex\gost\"
del /S *.aux *.idx *.log *.ilg *.out
del /S *.ind *.glo *.gls *.idx
del /S *.blg *.bbl *.bak
cd /d "%~dp0bibtex\gost\"
del /S *.aux *.idx *.log *.ilg *.out
del /S *.ind *.glo *.gls *.idx
del /S *.blg *.bbl *.bak
cd /d "%~dp0tex\latex\gost\"
del /S *.aux *.idx *.log *.ilg *.out
del /S *.ind *.glo *.gls *.idx
del /S *.blg *.bbl *.bak
