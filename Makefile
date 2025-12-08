# Makefile for LaTeX book project
# Builds KDP_book.pdf from sources in src/ directory

# Main source file
MAIN = src/main
OUTPUT = KDP_book.pdf

# LaTeX compiler (using lualatex as specified in main.tex)
LATEX = lualatex
LATEX_FLAGS = -interaction=nonstopmode -output-directory=.

# Default target
all: $(OUTPUT)

# Build the PDF
$(OUTPUT): $(MAIN).tex $(wildcard src/sections/*.tex)
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	$(LATEX) $(LATEX_FLAGS) $(MAIN).tex
	mv main.pdf $(OUTPUT)

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.out *.toc

# Clean everything including the PDF
distclean: clean
	rm -f $(OUTPUT)

.PHONY: all clean distclean
