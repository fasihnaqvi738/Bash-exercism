#!/usr/bin/env bash

name=$1
number=$2

last_two=$(( number % 100 ))
last_one=$(( number % 10 ))

if (( last_two >= 11 && last_two <= 13 )); then
    suffix="th"
else
    case $last_one in
        1) suffix="st" ;;
        2) suffix="nd" ;;
        3) suffix="rd" ;;
        *) suffix="th" ;;
    esac
fi

echo "$name, you are the ${number}${suffix} customer we serve today. Thank you!"
