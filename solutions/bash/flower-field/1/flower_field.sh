#!/usr/bin/env bash

grid=("$@")
rows=${#grid[@]}
cols=${#grid[0]}

dx=(-1 -1 -1 0 0 1 1 1)
dy=(-1 0 1 -1 1 -1 0 1)

count() {
  local r=$1 c=$2 n=0
  for i in {0..7}; do
    nr=$((r + dx[i]))
    nc=$((c + dy[i]))
    if (( nr >= 0 && nr < rows && nc >= 0 && nc < cols )); then
      [[ "${grid[nr]:nc:1}" == "*" ]] && ((n++))
    fi
  done
  echo "$n"
}

for ((r=0; r<rows; r++)); do
  row="${grid[r]}"
  out=""
  for ((c=0; c<cols; c++)); do
    ch="${row:c:1}"
    if [[ "$ch" == "*" ]]; then
      out+="*"
    else
      k=$(count "$r" "$c")
      ((k==0)) && out+=" " || out+="$k"
    fi
  done
  echo "$out"
done
