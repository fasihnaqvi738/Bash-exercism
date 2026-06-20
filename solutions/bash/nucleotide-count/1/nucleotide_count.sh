#!/usr/bin/env bash

dna=$1

a=0
c=0
g=0
t=0

for ((i = 0; i < ${#dna}; i++)); do
    case "${dna:i:1}" in
        A) ((a++)) ;;
        C) ((c++)) ;;
        G) ((g++)) ;;
        T) ((t++)) ;;
        *)
            echo "Invalid nucleotide in strand"
            exit 1
            ;;
    esac
done

echo "A: $a"
echo "C: $c"
echo "G: $g"
echo "T: $t"
