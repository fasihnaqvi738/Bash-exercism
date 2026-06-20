#!/usr/bin/env bash

n=$1

if (( n <= 0 )); then
    exit 0
fi

row=(1)

for ((i=1; i<=n; i++)); do
    indent=$((n - i))

    printf "%*s" "$indent" ""

    echo "${row[*]}"

    next=(1)

    for ((j=1; j<${#row[@]}; j++)); do
        next+=( $(( row[j-1] + row[j] )) )
    done

    if (( i < n )); then
        next+=(1)
    fi

    row=("${next[@]}")
done
