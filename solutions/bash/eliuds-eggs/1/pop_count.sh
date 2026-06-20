#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
    echo "usage: $0 <number>"
    exit 1
fi

n=$1
count=0

while (( n > 0 )); do
    (( count += n % 2 ))
    (( n /= 2 ))
done

echo "$count"
