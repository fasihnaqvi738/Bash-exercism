#!/usr/bin/env bash

digits=$1
length=$2

if [[ -z $digits ]]; then
    echo "series cannot be empty"
    exit 1
fi

if (( length < 0 )); then
    echo "slice length cannot be negative"
    exit 1
fi

if (( length == 0 )); then
    echo "slice length cannot be zero"
    exit 1
fi

if (( length > ${#digits} )); then
    echo "slice length cannot be greater than series length"
    exit 1
fi

result=()

for (( i=0; i<=${#digits}-length; i++ )); do
    result+=("${digits:i:length}")
done

echo "${result[*]}"