@echo Подготовка файлов примеров 
@echo ==========================

@echo Переименование предыдущего общего файла

rename .\bib\examples.bib examples.bak

@echo Копирование массы маленьких файлов в один большой

copy .\bib\ex*.bib .\bib\examples.bib

@echo Циклическая генерация примеров

for %%f in (gost7*.tex) do pdflatex -quiet %%f 
for %%f in (gost200*.tex) do pdflatex -quiet %%f 

@echo Циклическая обработка bibtex8 *.aux, без этого 'чуда не будет'

for %%f in (gost*.aux) do bibtex8 -B -c cp1251.csf %%f 

@echo Циклическая генерация примеров (заход после bibtex8)

for %%f in (gost7*.tex) do pdflatex %%f 
for %%f in (gost200*.tex) do pdflatex %%f 
for %%f in (gost2008-nat*.tex) do pdflatex %%f 
for %%f in (gost2008-sort*.tex) do pdflatex %%f 

@echo Чистка папки от ненужных файлов

@del *.aux *.out *.toc *.brf .pdf
@del *.bbl 
@del *.blg 
@del *.log
@echo =======
