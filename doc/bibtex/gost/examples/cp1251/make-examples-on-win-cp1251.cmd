@echo Подготовка файлов примеров 
@echo ==========================

@echo Циклическая генерация примеров

for %%f in (gost200*.tex) do pdflatex %%f 

@echo Циклическая обработка bibtex8 *.aux, без этого 'чуда не будет'

for %%f in (gost*.aux) do bibtex8 -B -c cp1251.csf %%f 

@echo Циклическая генерация примеров (заход после bibtex8)

for %%f in (gost200*.tex) do pdflatex %%f 
pdflatex gost2008n.tex
pdflatex gost2008ns.tex

@echo Чистка папки от ненужных файлов

@del *.aux *.out *.toc *.brf .pdf
@del *.bbl 
@del *.blg 
@del *.log
@echo =======
