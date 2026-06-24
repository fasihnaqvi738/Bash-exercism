#!/usr/bin/env bash

mode=$1
text=$2

alphabet=abcdefghijklmnopqrstuvwxyz
reverse=zyxwvutsrqponmlkjihgfedcba

encode_char() {
  local ch=$1

  # letters
  if [[ $ch =~ [a-z] ]]; then
    pos=$(expr index "$alphabet" "$ch")
    echo -n "${reverse:$((pos-1)):1}"

  # digits stay same
  elif [[ $ch =~ [0-9] ]]; then
    echo -n "$ch"
  fi
}

clean=""
input=$(echo "$text" | tr '[:upper:]' '[:lower:]')

# remove punctuation (keep only letters + digits)
for (( i=0; i<${#input}; i++ )); do
  c="${input:$i:1}"
  if [[ $c =~ [a-z0-9] ]]; then
    clean+="$c"
  fi
done

result=""

if [[ "$mode" == "encode" ]]; then
  count=0

  for (( i=0; i<${#clean}; i++ )); do
    c="${clean:$i:1}"
    encoded=$(encode_char "$c")
    result+="$encoded"

    ((count++))
    if (( count % 5 == 0 && i != ${#clean}-1 )); then
      result+=" "
    fi
  done

else
  for (( i=0; i<${#clean}; i++ )); do
    c="${clean:$i:1}"
    result+=$(encode_char "$c")
  done
fi

echo "$result"