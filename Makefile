DOCS=index research publication activity

HDOCS=$(addsuffix .html, $(DOCS))
PHDOCS=$(addprefix html/, $(HDOCS))

.PHONY : docs
docs : $(PHDOCS)

.PHONY : update
update : $(PHDOCS)
	@echo -n 'Copying to server...'
	# insert code for copying to server here.
	@echo ' done.'

html/%.html : %.jemdoc MENU mywebsite.conf
	python2 jemdoc.py -c mywebsite.conf -o $@ $<

.PHONY : clean
clean :
	-rm -f html/*.html
