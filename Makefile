$(DOCPDF): $(SUBDIR) $(TEXSRC) lbref.bib .git/index
        pdflatex --interaction nonstopmode -halt-on-error -file-line-error $*.tex # >/dev/null
        makeindex -c -s myindex.ist $*.idx #2>/dev/null
        bibtex $* #>/dev/null
        pdflatex --interaction nonstopmode -halt-on-error -file-line-error $*.tex #>/dev/null
        makeindex -c -s myindex.ist $*.idx #2>/dev/null
        pdflatex  --interaction nonstopmode -halt-on-error -file-line-error $*.tex #>/dev/null
        rm -f $*.lo* *.aux $*.ilg $*.ind $*.toc $*.bbl $*.blg $*.out *.asc
