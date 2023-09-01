#!/bin/bash

cp latest-prompt.md temp.md
first_line=$(head -n 1 temp.md)
no_punct=$(echo "$first_line" | tr -d '[:punct:]')
no_spaces=$(echo "$no_punct" | tr ' ' '-')
filename=$(echo "$no_spaces" | cut -c 1-75)
filename=$(echo "$filename" | tr '[:upper:]' '[:lower:]')
mv temp.md "${filename}.md"
