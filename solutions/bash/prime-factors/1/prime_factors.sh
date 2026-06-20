#!/usr/bin/env bash

n=$1
factors=()

divisor=2

while (( divisor * divisor <= n )); do
    while (( n % divisor == 0 )); do
        factors+=("$divisor")
        (( n /= divisor ))
    done
    (( divisor++ ))
done

if (( n > 1 )); then
    factors+=("$n")
fi

echo "${factors[*]}"
