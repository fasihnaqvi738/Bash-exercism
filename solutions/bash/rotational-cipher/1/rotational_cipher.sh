#!/usr/bin/env bash

text="$1"
shift=$2
result=""

for ((i = 0; i < ${#text}; i++)); do
    ch="${text:i:1}"

    if [[ $ch =~ [a-z] ]]; then
        ascii=$(printf "%d" "'$ch")
        new=$(( (ascii - 97 + shift) % 26 + 97 ))
        result+=$(printf "\\$(printf '%03o' "$new")")

    elif [[ $ch =~ [A-Z] ]]; then
        ascii=$(printf "%d" "'$ch")
        new=$(( (ascii - 65 + shift) % 26 + 65 ))
        result+=$(printf "\\$(printf '%03o' "$new")")

    else
        result+="$ch"
    fi
done

echo "$result"
