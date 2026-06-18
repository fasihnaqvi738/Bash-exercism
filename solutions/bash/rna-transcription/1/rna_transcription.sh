#!/usr/bin/env bash

dna=$1
rna=""

for (( i=0; i<${#dna}; i++ )); do
    case "${dna:$i:1}" in
        G) rna+="C" ;;
        C) rna+="G" ;;
        T) rna+="A" ;;
        A) rna+="U" ;;
        *)
            echo "Invalid nucleotide detected."
            exit 1
            ;;
    esac
done

echo "$rna"
