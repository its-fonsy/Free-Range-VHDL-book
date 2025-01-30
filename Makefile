# Main book files
MASTER_TEX		:= master.tex
CHAPTERS_TEX	:= chapters/*.tex
BOOK_PDF			:= free_range_vhdl.pdf

# Booklet files
BOOKLET_TEX := booklet.tex
BOOKLET_PDF := free_range_vhdl-booklet.pdf

.PHONY: all clean distclean booklet book

$(BOOK_PDF): $(MASTER_TEX) $(CHAPTERS_TEX)
	latexmk -pdf -jobname=$(@:%.pdf=%) $<

$(BOOKLET_PDF): $(BOOKLET_TEX) $(MASTER_TEX) $(CHAPTERS_TEX)
	latexmk -pdf -jobname=$(@:%.pdf=%) $<

book: $(BOOK_PDF)

booklet: $(BOOKLET_PDF)

all: book booklet

clean:
	rm -f *.aux *.fdb_latexmk *.fls *.log *.out *.toc

distclean: clean
	rm -f *.pdf
