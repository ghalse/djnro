# Makefile for DjNRO (eduroam)
#

# You can set these variables from the command line.

VERSION	        = "0.8"
SPHINXOPTS      = -D version=$(VERSION) -D release=$(VERSION)
SPHINXBUILD     = sphinx-build
PAPER           =
DOCSDIR			= docs
SRCDIR          = source
BUILDDIR        = docbuild
# Internal variables.
PAPEROPT_a4     = -D latex_paper_size=a4
PAPEROPT_letter = -D latex_paper_size=letter
ALLSPHINXOPTS   = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
SPHINXFILES     = $(DOCSDIR)/$(SRCDIR)/*

.PHONY: help doc docclean

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  doc		to make html and api doc"
	@echo "  docclean	to clean up API and HTML docuentation"
	@echo "  html      	to make standalone sphinx HTML files"
	
	
docclean:
	@rm -rf $(BUILDDIR)
	@echo "Removed $(BUILDDIR)"

doc:	$(BUILDDIR)/html

$(BUILDDIR)/html: $(SPHINXFILES)
	@mkdir -p $(BUILDDIR)
	@test -n "sphinx-build" || \
		{ echo 'sphinx-build' not found during configure; exit 1; }
	sphinx-build -b html \
		$(ALLSPHINXOPTS) -d $(BUILDDIR)/doctrees $(DOCSDIR)/$(SRCDIR) $(BUILDDIR)/html
