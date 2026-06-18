#!/usr/bin/env bash

word=$(echo "$1" | tr '[:lower:]' '[:upper:]')
score=0

for (( i=0; i<${#word}; i++ )); do
    letter="${word:$i:1}"

    case "$letter" in
        A|E|I|O|U|L|N|R|S|T) ((score += 1)) ;;
        D|G)                 ((score += 2)) ;;
        B|C|M|P)             ((score += 3)) ;;
        F|H|V|W|Y)           ((score += 4)) ;;
        K)                   ((score += 5)) ;;
        J|X)                 ((score += 8)) ;;
        Q|Z)                 ((score += 10)) ;;
    esac
done

echo "$score"
