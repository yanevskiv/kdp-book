.PHONY: all book figures clean

# Output PDF name
OUTPUT = build/kdp-book.pdf

# Book metadata, LaTeX preamble and pandoc filter
METADATA = metadata.yaml
PREAMBLE = src/preamble.tex
FILTER = tools/listings.lua

# Book sections in reading order; sort -V puts 2.10 after 2.9
SECTIONS = $(shell ls src/sections/*.md | sort -V)

# Default target, the book and the figures
all: book figures

# Only the book
book: $(OUTPUT)

# Convert Markdown to PDF (LaTeX report class, LuaLaTeX)
$(OUTPUT): $(METADATA) $(PREAMBLE) $(FILTER) $(SECTIONS) $(wildcard src/assets/*)
	@mkdir -p $(@D)
	pandoc $(SECTIONS) \
		--metadata-file=$(METADATA) \
		--include-in-header=$(PREAMBLE) \
		--lua-filter=$(FILTER) \
		--resource-path=src/sections \
		--top-level-division=chapter \
		--pdf-engine=lualatex \
		--output=$@

# Render TikZ figures, src/figures/<name>.tex -> build/figures/<name>.png
FIGURES = $(patsubst src/figures/%.tex,build/figures/%.png,$(wildcard src/figures/*.tex))

figures: $(FIGURES)

build/figures/%.png: src/figures/%.tex tools/gen_figure.sh
	@mkdir -p $(@D)
	./tools/gen_figure.sh $< $@

# Clean build files
clean:
	rm -rf build
