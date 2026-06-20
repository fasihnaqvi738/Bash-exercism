#!/usr/bin/env bash

modifier() {
    local score=$1
    local diff=$((score - 10))

    if (( diff < 0 && diff % 2 != 0 )); then
        echo $(( diff / 2 - 1 ))
    else
        echo $(( diff / 2 ))
    fi
}

ability() {
    local rolls=()
    local min=7
    local sum=0

    for ((i = 0; i < 4; i++)); do
        roll=$((RANDOM % 6 + 1))
        ((sum += roll))

        if (( roll < min )); then
            min=$roll
        fi
    done

    echo $((sum - min))
}

generate() {
    strength=$(ability)
    dexterity=$(ability)
    constitution=$(ability)
    intelligence=$(ability)
    wisdom=$(ability)
    charisma=$(ability)

    con_mod=$(modifier "$constitution")
    hitpoints=$((10 + con_mod))

    echo "strength $strength"
    echo "dexterity $dexterity"
    echo "constitution $constitution"
    echo "intelligence $intelligence"
    echo "wisdom $wisdom"
    echo "charisma $charisma"
    echo "hitpoints $hitpoints"
}

case "$1" in
    modifier)
        modifier "$2"
        ;;
    ability)
        ability
        ;;
    generate)
        generate
        ;;
    *)
        echo "Usage: $0 modifier <score> | ability | generate"
        exit 1
        ;;
esac
