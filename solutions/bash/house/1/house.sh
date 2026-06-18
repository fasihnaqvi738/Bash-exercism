#!/usr/bin/env bash

start=$1
end=$2

if [ "$start" -lt 1 ] || [ "$start" -gt 12 ] || \
   [ "$end" -lt 1 ] || [ "$end" -gt 12 ] || \
   [ "$start" -gt "$end" ]; then
    echo "invalid verse"
    exit 1
fi

subject() {
    case $1 in
        1) echo "the house that Jack built." ;;
        2) echo "the malt" ;;
        3) echo "the rat" ;;
        4) echo "the cat" ;;
        5) echo "the dog" ;;
        6) echo "the cow with the crumpled horn" ;;
        7) echo "the maiden all forlorn" ;;
        8) echo "the man all tattered and torn" ;;
        9) echo "the priest all shaven and shorn" ;;
        10) echo "the rooster that crowed in the morn" ;;
        11) echo "the farmer sowing his corn" ;;
        12) echo "the horse and the hound and the horn" ;;
    esac
}

action() {
    case $1 in
        2) echo "that lay in" ;;
        3) echo "that ate" ;;
        4) echo "that killed" ;;
        5) echo "that worried" ;;
        6) echo "that tossed" ;;
        7) echo "that milked" ;;
        8) echo "that kissed" ;;
        9) echo "that married" ;;
        10) echo "that woke" ;;
        11) echo "that kept" ;;
        12) echo "that belonged to" ;;
    esac
}

verse() {
    n=$1

    echo "This is $(subject "$n")"

    while [ "$n" -gt 1 ]; do
        echo "$(action "$n") $(subject $((n-1)))"
        n=$((n-1))
    done
}

v=$start
while [ "$v" -le "$end" ]; do
    verse "$v"

    if [ "$v" -lt "$end" ]; then
        echo
    fi

    v=$((v+1))
done