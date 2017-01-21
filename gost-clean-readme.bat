@echo Удаление файлов из папки вызова скрипта:
@del README README.md
@cd /d "%~dp0source\bibtex\gost\"
@echo Удаление файлов из подпапки source\bibtex\gost\:
@del README README.md
@cd /d "%~dp0doc\bibtex\gost\"
@echo Удаление файлов из подпапки doc\bibtex\gost\:
@del README README.md
@echo =====
