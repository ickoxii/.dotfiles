#!/usr/bin/env bash

HTML_DIR="html"
TOC_FILE="index.md"

mkdir "$HTML_DIR"
[[ $? -ne 0 ]] && exit 1

echo "# Table of Contents" > "$TOC_FILE"

for file in *.md; do
    [ -e "$file" ] || continue

    filename=$(basename -- "$file")
    htmlname="${file%.md}.html"

    lecture=$(echo "$filename" | cut -d'-' -f2- | sed 's/.md//')

    if [ -z "$lecture" ]; then
        lecture=$(head -n 1 "$file" | sed 's/# //')
    fi

    echo "- [$lecture]($htmlname)" >> "$TOC_FILE"

    pandoc -s -f markdown -t html5 -o "${HTML_DIR}/$htmlname" "$file"
done

pandoc -s -f markdown -t html5 "$TOC_FILE" -o "${HTML_DIR}/${TOC_FILE%.md}.html"

