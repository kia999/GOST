@echo Сборка архива для размещения на CTAN
@echo =============================================================
@echo Удаление предыдущей версии файла
@del gost.zip
@echo Вызов скрипта удаления папки gost\
@call "%~dp0gost-remove-gost-folder.bat"
@echo Вызов скрипта подготовки файлов для пакета
@call "%~dp0gost-prepare-files.cmd"
@echo Вызов скрипта подготовки файлов для CTAN в папке gost\
@call "%~dp0gost-create-gost-folder-after-prepare.cmd"
@echo Вызов скрипта подготовки файлов в архиве со структурой TDS
@call "%~dp0gost-zip-tds-after-prepare.bat"
@echo Вызов скрипта подготовки файлов в архиве со структурой TDS
@echo Непосредственно архивирование папки gost\
zip -r gost.zip gost gost.tds.zip -x *.bst *.blg *.bbl *.bak gost\doc\examples\*\bibnocap.sty
@echo Вызов скрипта удаления папки gost\
@call "%~dp0gost-remove-gost-folder.bat"
