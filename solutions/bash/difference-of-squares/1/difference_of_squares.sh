#!/usr/bin/env bash

n=$2

square_of_sum() {
    local sum=$(( n * (n + 1) / 2 ))
    echo $(( sum * sum ))
}

sum_of_squares() {
    echo $(( n * (n + 1) * (2 * n + 1) / 6 ))
}

difference() {
    echo $(( $(square_of_sum) - $(sum_of_squares) ))
}

case "$1" in
    square_of_sum) square_of_sum ;;
    sum_of_squares) sum_of_squares ;;
    difference) difference ;;
esac
