#!/usr/bin/env bash

isbn=${1//-/}

if [[ ! $isbn =~ ^[0-9]{9}[0-9X]$ ]]; then
    echo "false"
    exit 0
fi

sum=0

for ((i=0; i<10; i++)); do
    ch=${isbn:i:1}

    if [[ $ch == X ]]; then
        digit=10
    else
        digit=$ch
    fi

    sum=$((sum + digit * (10 - i)))
done

if (( sum % 11 == 0 )); then
    echo "true"
else
    echo "false"
fi
