#!/usr/bin/env bash

text="$1"

declare -A counts

# Convert to lowercase
text=${text,,}

# Extract words:
# - letters and digits
# - apostrophes allowed only inside words
while IFS= read -r word; do
    ((counts["$word"]++))
done < <(grep -oE "[a-z0-9]+('[a-z0-9]+)?|[a-z0-9]+" <<< "$text")

for word in "${!counts[@]}"; do
    echo "$word: ${counts[$word]}"
done
