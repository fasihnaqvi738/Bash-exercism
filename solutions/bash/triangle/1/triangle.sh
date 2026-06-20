#!/usr/bin/env bash

type=$1
a=$2
b=$3
c=$4

# Validate triangle
valid=$(awk -v a="$a" -v b="$b" -v c="$c" '
BEGIN {
    if (a <= 0 || b <= 0 || c <= 0) {
        print 0
    } else if (a + b < c || a + c < b || b + c < a) {
        print 0
    } else {
        print 1
    }
}')

if [[ $valid -eq 0 ]]; then
    echo "false"
    exit 0
fi

case "$type" in
    equilateral)
        awk -v a="$a" -v b="$b" -v c="$c" '
        BEGIN {
            if (a == b && b == c) print "true";
            else print "false";
        }'
        ;;
    isosceles)
        awk -v a="$a" -v b="$b" -v c="$c" '
        BEGIN {
            if (a == b || a == c || b == c) print "true";
            else print "false";
        }'
        ;;
    scalene)
        awk -v a="$a" -v b="$b" -v c="$c" '
        BEGIN {
            if (a != b && a != c && b != c) print "true";
            else print "false";
        }'
        ;;
    *)
        exit 1
        ;;
esac