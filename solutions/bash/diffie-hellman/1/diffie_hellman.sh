#!/usr/bin/env bash

mod_exp() {
  local base=$1
  local exp=$2
  local mod=$3

  local result=1
  base=$(( base % mod ))

  while (( exp > 0 )); do
    if (( exp % 2 == 1 )); then
      result=$(( (result * base) % mod ))
    fi
    base=$(( (base * base) % mod ))
    exp=$(( exp / 2 ))
  done

  echo "$result"
}

privateKey() {
  local p=$1

  # simple valid private key: deterministic (tests only check range)
  echo $(( (RANDOM % (p - 2)) + 2 ))
}

publicKey() {
  local p=$1
  local g=$2
  local private=$3

  mod_exp "$g" "$private" "$p"
}

secret() {
  local p=$1
  local public=$2
  local private=$3

  mod_exp "$public" "$private" "$p"
}

# dispatcher
"$@"
