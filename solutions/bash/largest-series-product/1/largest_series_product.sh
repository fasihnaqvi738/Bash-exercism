#!/usr/bin/env bash

digits="$1"
span="$2"

if [ "$span" -lt 0 ]; then
    echo "span must not be negative"
    exit 1
fi

if ! [[ "$digits" =~ ^[0-9]*$ ]]; then
    echo "digits input must only contain digits"
    exit 1
fi

if [ "$span" -gt "${#digits}" ]; then
    echo "span must not exceed string length"
    exit 1
fi

if [ "$span" -eq 0 ]; then
    echo "1"
    exit 0
fi

max=0

for ((i=0; i<=${#digits}-span; i++)); do
    product=1

    for ((j=0; j<span; j++)); do
        digit="${digits:i+j:1}"
        product=$((product * digit))
    done

    if [ "$product" -gt "$max" ]; then
        max=$product
    fi
done

echo "$max"