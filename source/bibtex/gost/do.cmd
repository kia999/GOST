@echo Запуск сборки *.bst из *.dtx и сборки документации

pdflatex gost.dtx

@echo Making Index...
makeindex -r -s gind.ist gost
@echo Making Glossary...
makeindex -r -s gglo.ist -o gost.gls gost.glo

pdflatex gost.dtx
pdflatex gost.dtx

@echo Удаление временных файлов

@del *.aux *.idx *.log *.ilg *.out .pdf
@del *.ind *.glo *.gls *.idx *.hd
@del gost.ins