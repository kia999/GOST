@ECHO ==========================================================
@ECHO Этот скрипт вызывается автоматически из gost-prepare-*.cmd
@ECHO Можно также запускать из командной строки
@ECHO ==========================================================
@echo Удаление pdf-файлов из папки вызова скрипта:
@del *.pdf
@cd /d "%~dp0source\bibtex\gost\"
@echo Удаление pdf-файлов из подпапки source\bibtex\gost\:
@del /S *.pdf
@cd /d "%~dp0doc\bibtex\gost\"
@echo Удаление pdf-файлов из подпапки doc\bibtex\gost\:
@del /S *.pdf
@cd /d "%~dp0bibtex\gost\"
@echo Удаление pdf-файлов из подпапки bibtex\gost\:
@del /S *.pdf
@cd /d "%~dp0tex\latex\gost\"
@echo Удаление pdf-файлов из подпапки tex\latex\gost\:
@del /S *.pdf
@echo =====
