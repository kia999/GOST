@echo Подготовка архива с файлами в структуре TDS
@echo ===========================================
@echo Удаление предыдущей версии архива
@del gost.tds.zip
@echo Непосредственно архивирование структуры TDS без лишних файлов
zip -r gost.tds.zip bibtex doc source tex -x *do.cmd *.blg *.bbl *.bak
