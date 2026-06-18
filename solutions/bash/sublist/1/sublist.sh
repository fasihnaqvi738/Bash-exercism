#!/usr/bin/env bash

normalize() {
    local s="${1#[}"
    s="${s%]}"
    s="${s// /}"

    if [[ -z "$s" ]]; then
        echo ""
    else
        echo ",$s,"
    fi
}

a=$(normalize "$1")
b=$(normalize "$2")

if [[ "$a" == "$b" ]]; then
    echo "equal"
elif [[ -z "$a" ]]; then
    echo "sublist"
elif [[ -z "$b" ]]; then
    echo "superlist"
elif [[ "$b" == *"$a"* ]]; then
    echo "sublist"
elif [[ "$a" == *"$b"* ]]; then
    echo "superlist"
else
    echo "unequal"
fi