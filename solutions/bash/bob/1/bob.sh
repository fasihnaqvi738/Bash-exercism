#!/usr/bin/env bash

remark="$*"

# Silence
if [[ -z "${remark//[[:space:]]/}" ]]; then
    echo "Fine. Be that way!"
    exit 0
fi

# Question?
is_question=false
[[ $remark =~ \?[[:space:]]*$ ]] && is_question=true

# Yelling?
letters=$(echo "$remark" | tr -cd '[:alpha:]')
is_yelling=false
if [[ -n $letters && $letters == "${letters^^}" ]]; then
    is_yelling=true
fi

if $is_question && $is_yelling; then
    echo "Calm down, I know what I'm doing!"
elif $is_yelling; then
    echo "Whoa, chill out!"
elif $is_question; then
    echo "Sure."
else
    echo "Whatever."
fi
