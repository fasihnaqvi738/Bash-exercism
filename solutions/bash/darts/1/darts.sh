#!/usr/bin/env bash

if [[ $# -ne 2 ]]; then
    echo "Exactly 2 arguments required"
    exit 1
fi

number='^-?[0-9]+([.][0-9]+)?$'

if ! [[ $1 =~ $number && $2 =~ $number ]]; then
    echo "Arguments must be numbers"
    exit 1
fi

x=$1
y=$2

awk -v x="$x" -v y="$y" '
BEGIN {
    d = x*x + y*y

    if (d <= 1)
        print 10
    else if (d <= 25)
        print 5
    else if (d <= 100)
        print 1
    else
        print 0
}'
