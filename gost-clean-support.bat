@ECHO ==========================================================
@ECHO Этот скрипт вызывается автоматически из gost-prepare-*.cmd
@ECHO Можно также запускать из командной строки
@ECHO ==========================================================
@echo Удаление временных файлов из папки вызова скрипта:
@del *.aux *.idx *.log *.ilg *.out
@del *.ind *.glo *.gls *.idx
@del *.blg *.bbl *.bak
@cd /d "%~dp0source\bibtex\gost\"
@echo Удаление временных файлов из подпапки source\bibtex\gost\:
@del /S *.aux *.idx *.log *.ilg *.out
@del /S *.ind *.glo *.gls *.idx
@del /S *.blg *.bbl *.bak
@cd /d "%~dp0doc\bibtex\gost\"
@echo Удаление временных файлов из подпапки doc\bibtex\gost\:
@del /S *.aux *.idx *.log *.ilg *.out
@del /S *.ind *.glo *.gls *.idx
@del /S *.blg *.bbl *.bak
@cd /d "%~dp0bibtex\gost\"
@echo Удаление временных файлов из подпапки bibtex\gost\:
@del /S *.aux *.idx *.log *.ilg *.out
@del /S *.ind *.glo *.gls *.idx
@del /S *.blg *.bbl *.bak
@cd /d "%~dp0tex\latex\gost\"
@echo Удаление временных файлов из подпапки tex\latex\gost\:
@del /S *.aux *.idx *.log *.ilg *.out
@del /S *.ind *.glo *.gls *.idx
@del /S *.blg *.bbl *.bak
@echo =====
