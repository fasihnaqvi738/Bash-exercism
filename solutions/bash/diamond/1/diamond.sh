#!/usr/bin/env bash

letter=$1

end=$(( $(printf "%d" "'$letter") - 65 ))

for ((i=0; i<=end; i++)); do
    ch=$(printf "\\$(printf '%03o' $((65 + i)))")

    outer=$(( end - i ))

    if (( i == 0 )); then
        printf "%*s%s%*s\n" "$outer" "" "$ch" "$outer" ""
    else
        inner=$(( 2 * i - 1 ))
        printf "%*s%s%*s%s%*s\n" \
            "$outer" "" \
            "$ch" \
            "$inner" "" \
            "$ch" \
            "$outer" ""
    fi
done

for ((i=end-1; i>=0; i--)); do
    ch=$(printf "\\$(printf '%03o' $((65 + i)))")

    outer=$(( end - i ))

    if (( i == 0 )); then
        printf "%*s%s%*s\n" "$outer" "" "$ch" "$outer" ""
    else
        inner=$(( 2 * i - 1 ))
        printf "%*s%s%*s%s%*s\n" \
            "$outer" "" \
            "$ch" \
            "$inner" "" \
            "$ch" \
            "$outer" ""
    fi
done
