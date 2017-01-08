CALL gost-clean-support.bat
CALL gost-clean-bst.bat
CALL gost-clean-pdf.bat
cd /d "%~dp0source\bibtex\gost\"
latex gost.ins
del *.log
move /Y *.bst ..\..\..\bibtex\bst\gost\
cd /d "%~dp0"
