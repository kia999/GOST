@echo Сборка из исходных файлов репозитория исключительно свежих *.bst
@echo =============================================================
@echo Чистка папок от временных файлов LaTeX
@call "%~dp0gost-clean-support.bat"
@echo Чистка папок от остатков прошлых компиляций *.bst
@call "%~dp0gost-clean-bst.bat"
@echo Переход в подпапку с gost.dtx
@cd /d "%~dp0source\bibtex\gost\"
@echo Запуск сборки из *.dtx
latex gost.dtx
@echo Чистка папки от ненужных файлов
@del *.aux *.idx *.log *.ilg *.out *.dvi .pdf
@del *.ind *.glo *.gls *.idx *.hd
@del Readme.* gost.ins gost.pdf
@echo Перемещение созданных *.bst в предусмотренное для них место
@move /Y *.bst ..\..\..\bibtex\bst\gost\
@echo Возвращение в папку, из которой этот скрипт был вызван
@cd /d "%~dp0"
@echo ======================================================
