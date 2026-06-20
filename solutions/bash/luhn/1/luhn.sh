#!/usr/bin/env bash

input=$1

number=${input// /}

if [[ ! $number =~ ^[0-9]+$ ]]; then
    echo "false"
    exit 0
fi

if (( ${#number} <= 1 )); then
    echo "false"
    exit 0
fi

sum=0
double=0

for ((i=${#number}-1; i>=0; i--)); do
    digit=${number:i:1}

    if (( double )); then
        digit=$((digit * 2))
        (( digit > 9 )) && digit=$((digit - 9))
    fi

    sum=$((sum + digit))
    double=$((1 - double))
done

if (( sum % 10 == 0 )); then
    echo "true"
else
    echo "false"
fi
