#!/usr/bin/env bash

rna="$1"
result=()

for ((i=0; i<${#rna}; i+=3)); do
    codon="${rna:i:3}"

    case "$codon" in
        AUG) result+=("Methionine") ;;
        UUU|UUC) result+=("Phenylalanine") ;;
        UUA|UUG) result+=("Leucine") ;;
        UCU|UCC|UCA|UCG) result+=("Serine") ;;
        UAU|UAC) result+=("Tyrosine") ;;
        UGU|UGC) result+=("Cysteine") ;;
        UGG) result+=("Tryptophan") ;;
        UAA|UAG|UGA) break ;;
        "")
            break
            ;;
        *)
            echo "Invalid codon"
            exit 1
            ;;
    esac
done

printf '%s\n' "${result[*]}"
