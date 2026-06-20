#!/usr/bin/env bash

target=$1
shift

arr=("$@")

low=0
high=$((${#arr[@]} - 1))

while (( low <= high )); do
    mid=$(( (low + high) / 2 ))
    value=${arr[mid]}

    if (( value == target )); then
        echo "$mid"
        exit 0
    elif (( value < target )); then
        low=$(( mid + 1 ))
    else
        high=$(( mid - 1 ))
    fi
done

echo "-1"
