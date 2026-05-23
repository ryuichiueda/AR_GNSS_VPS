main.pdf: main.dvi
	dvipdfmx -f font.map -p a4 -V 7 main.dvi

main.dvi: *.tex
	sed -e 's/。/. /g' -e 's/、/, /g' main.tex > tmp.tex
	latex tmp.tex
	#pbibtex tmp.aux
	latex tmp.tex
	latex tmp.tex
	mv tmp.dvi main.dvi

clean:
	rm -f *.aux *.log *.dvi *.bbl *.blg *.ilg *.idx *.toc *.ind main.pdf tmp.tex

auto:
	git add -u && git commit -m "Update" && git push origin master
