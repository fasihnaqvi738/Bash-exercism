#!/usr/bin/env bash

input="$1"
stack=""

for ((i = 0; i < ${#input}; i++)); do
    ch="${input:i:1}"

    case "$ch" in
        "("|"["|"{")
            stack+="$ch"
            ;;
        ")")
            [[ ${stack: -1} == "(" ]] || { echo "false"; exit 0; }
            stack=${stack%?}
            ;;
        "]")
            [[ ${stack: -1} == "[" ]] || { echo "false"; exit 0; }
            stack=${stack%?}
            ;;
        "}")
            [[ ${stack: -1} == "{" ]] || { echo "false"; exit 0; }
            stack=${stack%?}
            ;;
    esac
done

[[ -z $stack ]] && echo "true" || echo "false"
