#!/usr/bin/env bash

diagram=$1
student=$2

row1=${diagram%%$'\n'*}
row2=${diagram#*$'\n'}

students=(
    Alice Bob Charlie David Eve Fred
    Ginny Harriet Ileana Joseph Kincaid Larry
)

for i in "${!students[@]}"; do
    if [[ "${students[i]}" == "$student" ]]; then
        idx=$i
        break
    fi
done

pos=$((idx * 2))

result=()

for plant in \
    "${row1:pos:1}" \
    "${row1:pos+1:1}" \
    "${row2:pos:1}" \
    "${row2:pos+1:1}"
do
    case "$plant" in
        G) result+=("grass") ;;
        C) result+=("clover") ;;
        R) result+=("radishes") ;;
        V) result+=("violets") ;;
    esac
done

echo "${result[*]}"
