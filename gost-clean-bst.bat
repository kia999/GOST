@echo Удаление файлов из папки вызова скрипта:

@del *.bst
@cd /d "%~dp0source\bibtex\gost\"
@echo Удаление файлов из подпапки source\bibtex\gost\:
@del /S *.bst
@cd /d "%~dp0doc\bibtex\gost\"
@echo Удаление файлов из подпапки doc\bibtex\gost\:
@del /S *.bst
@cd /d "%~dp0bibtex\bst\gost\"
@echo Удаление файлов из подпапки bibtex\bst\gost\:
@del /S *.bst
@echo =====
