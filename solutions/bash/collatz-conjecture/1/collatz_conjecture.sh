#!/usr/bin/env bash

n=$1

if (( n <= 0 )); then
    echo "Error: Only positive numbers are allowed"
    exit 1
fi

steps=0

while (( n != 1 )); do
    if (( n % 2 == 0 )); then
        n=$(( n / 2 ))
    else
        n=$(( 3 * n + 1 ))
    fi
    ((steps++))
done

echo "$steps"
#
# *** PLEASE REMOVE THESE COMMENTS BEFORE SUBMITTING YOUR SOLUTION ***
