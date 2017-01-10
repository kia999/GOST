CALL gost-clean-support.bat
CALL gost-clean-bst.bat
CALL gost-clean-pdf.bat
cd /d "%~dp0source\bibtex\gost\"
CALL do.cmd
move /Y gost.pdf ..\..\..\doc\bibtex\gost\
copy gost*.bst ..\..\..\bibtex\bst\gost\
copy ugost*.bst ..\..\..\bibtex\bst\gost\
move /Y gost*.bst ..\..\..\doc\bibtex\gost\examples\cp1251\
move /Y ugost*.bst ..\..\..\doc\bibtex\gost\examples\utf8\
cd /d "%~dp0doc\bibtex\gost\examples\cp1251\"
CALL make-examples-on-win-cp1251.cmd
del *.bst
del /S *.bak
cd /d "%~dp0doc\bibtex\gost\examples\utf8\"
CALL make-examples-on-win-utf8.cmd
del *.bst
del /S *.bak
@rem return to work in starting folder 
cd /d "%~dp0"
