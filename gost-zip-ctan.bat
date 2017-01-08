del gost.zip
CALL gost-remove-gost-folder.bat
CALL gost-prepare-files.cmd
CALL gost-create-gost-folder-after-prepare.cmd
CALL gost-zip-tds-after-prepare.bat
zip -r gost.zip gost gost.tds.zip -x *.bst *.blg *.bbl *.bak gost\doc\examples\*\bibnocap.sty
