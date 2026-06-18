#!/usr/bin/env bash

phrase=$1

echo "$phrase" |
    tr '-' ' ' |
    tr -cd '[:alnum:] \n' |
    awk '{
        for (i = 1; i <= NF; i++)
            printf toupper(substr($i, 1, 1))
        printf "\n"
    }'
