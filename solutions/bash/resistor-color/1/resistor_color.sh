#!/usr/bin/env bash

colors=(
    black brown red orange yellow
    green blue violet grey white
)

if [[ $1 == "colors" ]]; then
    printf "%s\n" "${colors[@]}"
    exit 0
fi

if [[ $1 == "code" ]]; then
    for i in "${!colors[@]}"; do
        if [[ ${colors[$i]} == "$2" ]]; then
            echo "$i"
            exit 0
        fi
    done
fi
