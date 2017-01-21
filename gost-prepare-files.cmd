@echo Сборка из исходных файлов репозитория остальных файлов пакета
@echo =============================================================
@echo Чистка папок от временных файлов LaTeX
@call "%~dp0gost-clean-support.bat"
@echo Чистка папок от остатков прошлых компиляций *.bst
@call "%~dp0gost-clean-bst.bat"
@echo Чистка папок от остатков прошлых компиляций *.pdf
@call "%~dp0gost-clean-pdf.bat"
@echo Чистка папок от остатков прошлых компиляций README*
@call "%~dp0gost-clean-readme.bat"
@echo Переход в подпапку с gost.dtx
@cd /d "%~dp0source\bibtex\gost\"
@echo Выполнение скрипта преобразования gost.dtx в массу разных файлов
@call do.cmd
@echo Перемещение созданных файлов в папки, где они должны располагаться
@move /Y gost.pdf ..\..\..\doc\bibtex\gost\
@copy gost*.bst ..\..\..\bibtex\bst\gost\
@copy ugost*.bst ..\..\..\bibtex\bst\gost\
@move /Y gost*.bst ..\..\..\doc\bibtex\gost\examples\cp1251\
@move /Y ugost*.bst ..\..\..\doc\bibtex\gost\examples\utf8\
@copy README.md ..\..\..\
@move /Y README.md ..\..\..\doc\bibtex\gost\
@move /Y README ..\..\..\
@echo Переход в подпапку с примерами для кодировки cp1251
@cd /d "%~dp0doc\bibtex\gost\examples\cp1251\"
@echo Выполнение скрипта сборки примеров применения стилей для кодировки cp1251
@call make-examples-on-win-cp1251.cmd
@echo Чистка папки от ненужных файлов
@del *.bst
@del /S *.bak
@echo Переход в подпапку с примерами для кодировки utf8
@cd /d "%~dp0doc\bibtex\gost\examples\utf8\"
@echo Выполнение скрипта сборки примеров применения стилей для кодировки utf8
@call make-examples-on-win-utf8.cmd
@echo Чистка папки от ненужных файлов
@del *.bst
@del /S *.bak
@echo Возвращение в папку, из которой этот скрипт был вызван
@cd /d "%~dp0"
@echo ======================================================
