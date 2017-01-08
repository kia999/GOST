ECHO  .
ECHO  Generating BST files...
ECHO  .

latex gost.ins
ECHO  .
ECHO  Generating Documentation...
ECHO  .

pdflatex gost.dtx
REM pause Making Index...
makeindex -r -s gind.ist gost
REM pause Making Glossary...
makeindex -r -s gglo.ist -o gost.gls gost.glo
REM pause
pdflatex gost.dtx
pdflatex gost.dtx
del *.aux *.idx *.log *.ilg *.out .pdf
del *.ind *.glo *.gls *.idx