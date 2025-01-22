MASTER := master.tex
PDF := master.pdf

.PHONY: all clean distclean booklet

$(PDF): $(MASTER) chapters/*.tex 
	latexmk -pdf $<

all: $(PDF) booklet

booklet: $(PDF) booklet.tex
	latexmk -pdf booklet.tex

clean:
	latexmk -c

distclean: clean
	rm -f *.pdf
