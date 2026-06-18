#!/usr/bin/env bash

target=$(echo "$1" | tr '[:upper:]' '[:lower:]')

sort_word() {
    echo "$1" | grep -o . | sort | tr -d '\n'
}

target_sorted=$(sort_word "$target")

matches=()

for word in $2; do
    lower=$(echo "$word" | tr '[:upper:]' '[:lower:]')

    [[ "$lower" == "$target" ]] && continue

    if [[ $(sort_word "$lower") == "$target_sorted" ]]; then
        matches+=("$word")
    fi
done

echo "${matches[*]}"
