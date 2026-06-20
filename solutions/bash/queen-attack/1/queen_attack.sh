#!/usr/bin/env bash

white=""
black=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -w)
            white="$2"
            shift 2
            ;;
        -b)
            black="$2"
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

IFS=',' read -r wr wc <<< "$white"
IFS=',' read -r br bc <<< "$black"

validate() {
    local row=$1
    local col=$2

    if (( row < 0 )); then
        echo "row not positive"
        exit 1
    fi

    if (( col < 0 )); then
        echo "column not positive"
        exit 1
    fi

    if (( row > 7 )); then
        echo "row not on board"
        exit 1
    fi

    if (( col > 7 )); then
        echo "column not on board"
        exit 1
    fi
}

validate "$wr" "$wc"
validate "$br" "$bc"

if (( wr == br && wc == bc )); then
    echo "same position"
    exit 1
fi

# same row or column
if (( wr == br || wc == bc )); then
    echo "true"
    exit 0
fi

# diagonal attack
dr=$(( wr - br ))
dc=$(( wc - bc ))

(( dr < 0 )) && dr=$(( -dr ))
(( dc < 0 )) && dc=$(( -dc ))

if (( dr == dc )); then
    echo "true"
else
    echo "false"
fi