#!/usr/bin/env bash

input_base=$1
digits_string=$2
output_base=$3

if (( input_base < 2 )); then
    echo "input base must be >= 2"
    exit 1
fi

if (( output_base < 2 )); then
    echo "output base must be >= 2"
    exit 1
fi

read -ra digits <<< "$digits_string"

value=0

for digit in "${digits[@]}"; do
    if (( digit < 0 || digit >= input_base )); then
        echo "all digits must satisfy 0 <= d < input base"
        exit 1
    fi

    value=$(( value * input_base + digit ))
done

if (( value == 0 )); then
    echo "0"
    exit 0
fi

result=()

while (( value > 0 )); do
    result=( "$(( value % output_base ))" "${result[@]}" )
    value=$(( value / output_base ))
done

echo "${result[*]}"