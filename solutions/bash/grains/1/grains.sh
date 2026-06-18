#!/usr/bin/env bash

if [[ "$1" == "total" ]]; then
    echo "2^64 - 1" | bc

elif [[ "$1" =~ ^[0-9]+$ ]]; then

    if (( $1 < 1 || $1 > 64 )); then
        echo "Error: invalid input"
        exit 1
    fi

    echo "2^($1 - 1)" | bc

else
    echo "Error: invalid input"
    exit 1
fi