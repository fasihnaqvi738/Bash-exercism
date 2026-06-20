#!/usr/bin/env bash

n=$1

if (( n <= 0 || n > 3999 )); then
  echo ""
  exit 0
fi

values=(1000 900 500 400 100 90 50 40 10 9 5 4 1)
symbols=(M CM D CD C XC L XL X IX V IV I)

result=""

for i in "${!values[@]}"; do
  while (( n >= values[i] )); do
    result+="${symbols[i]}"
    (( n -= values[i] ))
  done
done

echo "$result"
