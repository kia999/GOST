@echo Удаление файлов из папки вызова скрипта:
@del *.pdf
@cd /d "%~dp0source\bibtex\gost\"
@echo Удаление файлов из подпапки source\bibtex\gost\:
@del /S *.pdf
@cd /d "%~dp0doc\bibtex\gost\"
@echo Удаление файлов из подпапки doc\bibtex\gost\:
@del /S *.pdf
@cd /d "%~dp0bibtex\gost\"
@echo Удаление файлов из подпапки bibtex\gost\:
@del /S *.pdf
@cd /d "%~dp0tex\latex\gost\"
@echo Удаление файлов из подпапки tex\latex\gost\:
@del /S *.pdf
@echo =====
