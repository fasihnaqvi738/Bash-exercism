#!/usr/bin/env bash

limit=$1
shift

declare -A seen
sum=0

for factor in "$@"; do
    # Ignore zero factors
    (( factor == 0 )) && continue

    for (( n = factor; n < limit; n += factor )); do
        if [[ -z ${seen[$n]} ]]; then
            seen[$n]=1
            (( sum += n ))
        fi
    done
done

echo "$sum"
