@echo �����⮢�� 䠩��� �ਬ�஢ 
@echo ==========================

@echo ������᪠� ������� �ਬ�஢

for %%f in (ugost7*.tex) do pdflatex %%f 
for %%f in (ugost200*.tex) do pdflatex %%f 

@echo ������᪠� ��ࠡ�⪠ bibtex8 *.aux, ��� �⮣� '�㤠 �� �㤥�'

for %%f in (ugost*.aux) do bibtex8 -B -c utf8cyrillic.csf %%f 

@echo ������᪠� ������� �ਬ�஢ (��室 ��᫥ bibtex8)

for %%f in (ugost7*.tex) do pdflatex %%f 
for %%f in (ugost200*.tex) do pdflatex %%f 
pdflatex ugost2008n.tex
pdflatex ugost2008ns.tex
pdflatex ugost2008s.tex

@echo ���⪠ ����� �� ���㦭�� 䠩���

@del *.aux *.out *.toc *.brf .pdf
@del *.bbl 
@del *.blg 
@del *.log
@echo =======
