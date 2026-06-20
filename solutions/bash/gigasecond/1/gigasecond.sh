#!/usr/bin/env bash

input="$1"

epoch=$(date -u -d "$input" +%s)
epoch=$((epoch + 1000000000))

date -u -d "@$epoch" "+%Y-%m-%dT%H:%M:%S"