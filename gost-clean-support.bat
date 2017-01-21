@echo Удаление файлов из папки вызова скрипта:
@del *.aux *.idx *.log *.ilg *.out *.dvi
@del *.ind *.glo *.gls *.idx *.hd
@del *.blg *.bbl *.bak
@cd /d "%~dp0source\bibtex\gost\"
@echo Удаление файлов из подпапки source\bibtex\gost\:
@del /S *.aux *.idx *.log *.ilg *.out *.dvi
@del /S *.ind *.glo *.gls *.idx *.hd
@del /S *.blg *.bbl *.bak
@cd /d "%~dp0doc\bibtex\gost\"
@echo Удаление файлов из подпапки doc\bibtex\gost\:
@del /S *.aux *.idx *.log *.ilg *.out *.dvi
@del /S *.ind *.glo *.gls *.idx *.hd
@del /S *.blg *.bbl *.bak
@echo =====
