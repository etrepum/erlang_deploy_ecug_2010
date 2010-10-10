OUTPUT=slides.html# slides.pdf

all: $(OUTPUT)

clean:
	rm -f $(OUTPUT) slides.{snm,aux,out,log,nav,toc,latex}

slides.latex: slides.txt ui/beamerdefs.txt ui/stylesheet.latex ui/author.latex
	./bin/rst2beamer.py --stylesheet=ui/stylesheet.latex --documentoptions=14pt slides.txt $@
	sed -i.old 's/\\date{}/\\input{ui\/author.latex}/' $@

slides.pdf: slides.latex
	pdflatex slides.latex

slides.html: slides.txt includes/*.html
	rst2s5.py --theme-url ui/mochikit slides.txt $@
	./bin/fixup_definitions.py $@

testdata.db: bin/make_testdata.py
	./bin/make_testdata.py $@

.PHONY: all clean
