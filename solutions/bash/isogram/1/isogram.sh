#!/usr/bin/env bash

word=${1,,}   # convert to lowercase

declare -A seen

for ((i = 0; i < ${#word}; i++)); do
    ch=${word:i:1}

    # ignore spaces and hyphens
    [[ $ch == " " || $ch == "-" ]] && continue

    if [[ -n ${seen[$ch]} ]]; then
        echo "false"
        exit 0
    fi

    seen[$ch]=1
done

echo "true"