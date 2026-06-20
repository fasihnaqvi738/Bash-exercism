#!/usr/bin/env bash

translate() {
    word=$1

    # vowel rule
    if [[ $word =~ ^(xr|yt|[aeiou]) ]]; then
        echo "${word}ay"
        return
    fi

    # qu rule (MOST IMPORTANT FIX)
    if [[ $word =~ ^([^aeiou]*qu)(.*) ]]; then
        echo "${word:${#BASH_REMATCH[1]}}${BASH_REMATCH[1]}ay"
        return
    fi

    len=${#word}

    for ((i=0; i<len; i++)); do
        c=${word:i:1}

        if [[ $c =~ [aeiou] || ( $i -ne 0 && $c == "y" ) ]]; then
            echo "${word:i}${word:0:i}ay"
            return
        fi
    done

    echo "${word}ay"
}

for w in "$@"; do
    translate "$w"
done | paste -sd" " -
