#!/usr/bin/env bash

n=$1

low=1
high=$n

while (( low <= high )); do
    mid=$(( (low + high) / 2 ))
    square=$(( mid * mid ))

    if (( square == n )); then
        echo "$mid"
        exit 0
    elif (( square < n )); then
        low=$(( mid + 1 ))
    else
        high=$(( mid - 1 ))
    fi
done
