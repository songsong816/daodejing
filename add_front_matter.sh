#!/usr/bin/env bash

for n in $(seq -w 1 81); do
  file="chapters-new/${n}.md"
  tmp="$(mktemp)"
  title_cn=$(grep -m1 -oP '^#?\s*第[\d一二三四五六七八九十]+章.*' "$file" | sed 's/^#\s*//')
  [[ -z $title_cn ]] && title_cn="第${n}章"

  {
    echo '---'
    echo "layout: default"
    echo "title: ${title_cn}"
    echo "permalink: /chapters-new/${n}.html"
    echo '---'
    echo
    cat "$file"
  } > "$tmp"

  mv "$tmp" "$file"
  echo "✔ added front-matter to $file"
