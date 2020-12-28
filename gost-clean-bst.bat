@ECHO ==========================================================
@ECHO Этот скрипт вызывается автоматически из gost-prepare-*.cmd
@ECHO Можно также запускать из командной строки
@ECHO ==========================================================
@echo Удаление bst-файлов из папки вызова скрипта:
@del *.bst
@cd /d "%~dp0source\bibtex\gost\"
@echo Удаление bst-файлов из подпапки source\bibtex\gost\:
@del /S *.bst
@cd /d "%~dp0doc\bibtex\gost\"
@echo Удаление bst-файлов из подпапки doc\bibtex\gost\:
@del /S *.bst
@cd /d "%~dp0bibtex\bst\gost\"
@echo Удаление bst-файлов из подпапки bibtex\bst\gost\:
@del /S *.bst
@cd /d "%~dp0tex\latex\gost\"
@echo Удаление bst-файлов из подпапки tex\latex\gost\:
@del /S *.bst
@echo =====
