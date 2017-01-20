@echo Подготовка файлов примеров 
@echo ==========================

@echo Циклическая генерация примеров

for %%f in (ugost200*.tex) do pdflatex %%f 

@echo Циклическая обработка bibtex8 *.aux, без этого 'чуда не будет'

for %%f in (ugost*.aux) do bibtex8 -B -c utf8cyrillic.csf %%f 

@echo Циклическая генерация примеров (заход после bibtex8)

for %%f in (ugost200*.tex) do pdflatex %%f 
pdflatex ugost2008n.tex
pdflatex ugost2008ns.tex
pdflatex ugost2008s.tex

@echo Чистка папки от ненужных файлов

@del *.aux *.out *.toc *.brf .pdf
@del *.bbl 
@del *.blg 
@del *.log
@echo =======
