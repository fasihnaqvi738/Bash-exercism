#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
    echo "2 arguments expected"
    exit 1
fi

start=$1
count=$2

if (( count > start )); then
    echo "cannot generate more verses than bottles"
    exit 1
fi

numbers=(
    "no" "one" "two" "three" "four"
    "five" "six" "seven" "eight" "nine" "ten"
)

verse() {
    local n=$1
    local next=$((n - 1))

    local current="${numbers[n]^}"
    local following="${numbers[next]}"

    local bottle="bottles"
    local next_bottle="bottles"

    (( n == 1 )) && bottle="bottle"
    (( next == 1 )) && next_bottle="bottle"

    cat <<EOF
${current} green ${bottle} hanging on the wall,
${current} green ${bottle} hanging on the wall,
And if one green bottle should accidentally fall,
There'll be ${following} green ${next_bottle} hanging on the wall.
EOF
}

for ((i = 0; i < count; i++)); do
    verse $((start - i))

    if (( i < count - 1 )); then
        echo
    fi
done