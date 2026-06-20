#!/usr/bin/env bash

limit=$1

if (( limit < 2 )); then
    exit 0
fi

declare -a prime

for ((i = 2; i <= limit; i++)); do
    prime[i]=1
done

for ((p = 2; p * p <= limit; p++)); do
    if [[ ${prime[p]} ]]; then
        for ((multiple = p * p; multiple <= limit; multiple += p)); do
            unset "prime[multiple]"
        done
    fi
done

result=()

for ((i = 2; i <= limit; i++)); do
    if [[ ${prime[i]} ]]; then
        result+=("$i")
    fi
done

echo "${result[*]}"
