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
@echo Непосредственно архивирование папки gost\
zip -r gost.zip gost -x *.bst *.blg *.bbl *.bak
@echo Вызов скрипта удаления папки gost\
@call "%~dp0gost-remove-gost-folder.bat"
