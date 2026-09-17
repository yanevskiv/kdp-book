#!/usr/bin/env bash
#
# Renders a standalone TikZ document into a PNG image
#
#   usage: gen_figure.sh <input.tex> <output.png>
#
set -euo pipefail

if [ $# -ne 2 ]; then
    echo "usage: $0 <input.tex> <output.png>" >&2
    exit 1
fi

INPUT=$1
OUTPUT=$2
DPI=300

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

if ! lualatex -interaction=nonstopmode -halt-on-error \
        -output-directory="$TMP_DIR" -jobname=figure "$INPUT" > /dev/null; then
    cat "$TMP_DIR/figure.log" >&2
    exit 1
fi

# pdftoppm appends the .png extension itself
pdftoppm -png -r "$DPI" -singlefile "$TMP_DIR/figure.pdf" "${OUTPUT%.png}"
