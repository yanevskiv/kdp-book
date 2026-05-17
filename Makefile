.PHONY: all clean

# Output PDF name
OUTPUT = KDP-book.pdf

# Main LaTeX file
MAIN = src/main.tex

# Default target
all: $(OUTPUT)

# Compile LaTeX to PDF with renamed output
$(OUTPUT): $(MAIN)
	lualatex -jobname=KDP-book $(MAIN)
	lualatex -jobname=KDP-book $(MAIN)

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.out *.toc *.lof *.lot *.fls *.fdb_latexmk *.synctex.gz
	rm -f $(OUTPUT)
