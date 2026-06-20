#!/usr/bin/env bash

declare -A color=(
    [black]=0
    [brown]=1
    [red]=2
    [orange]=3
    [yellow]=4
    [green]=5
    [blue]=6
    [violet]=7
    [grey]=8
    [white]=9
)

for c in "$1" "$2" "$3"; do
    if [[ ! -v color["$c"] ]]; then
        echo "invalid color"
        exit 1
    fi
done

first=${color[$1]}
second=${color[$2]}
zeros=${color[$3]}

value=$(( (10 * first + second) * (10 ** zeros) ))

if (( value == 0 )); then
    echo "0 ohms"
elif (( value % 1000000000 == 0 )); then
    echo "$(( value / 1000000000 )) gigaohms"
elif (( value % 1000000 == 0 )); then
    echo "$(( value / 1000000 )) megaohms"
elif (( value % 1000 == 0 )); then
    echo "$(( value / 1000 )) kiloohms"
else
    echo "$value ohms"
fi
