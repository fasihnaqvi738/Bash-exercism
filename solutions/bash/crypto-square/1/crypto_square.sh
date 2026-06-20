#!/usr/bin/env bash

main() {
  local input="$*"

  # 1. normalize: remove non-alphanumeric, lowercase
  local msg
  msg=$(echo "$input" | tr -cd '[:alnum:]' | tr '[:upper:]' '[:lower:]')

  local len=${#msg}
  (( len == 0 )) && { echo ""; return; }

  # 2. find rectangle dimensions r and c
  local r c
  r=$(awk -v n="$len" 'BEGIN {
    r = int(sqrt(n));
    if (r*r < n) r++;
    print r
  }')

  c=$r
  if (( r * (r - 1) >= len )); then
    c=$((r - 1))
  fi

  # ensure c >= r? (problem allows c >= r, so swap if needed)
  if (( c < r )); then
    local tmp=$r
    r=$c
    c=$tmp
  fi

  # recompute safe
  if (( r * c < len )); then
    c=$((c + 1))
  fi

  # 3. build grid (row-wise)
  local -a grid
  for ((i=0; i<len; i+=c)); do
    grid+=("${msg:i:c}")
  done

  # pad last row if needed
  local last=${#grid[@]}
  last=$((last - 1))
  local last_len=${#grid[last]}
  if (( last_len < c )); then
    grid[last]="${grid[last]}$(printf '%*s' $((c - last_len)) '')"
  fi

  # 4. read column-wise
  local result=""
  for ((col=0; col<c; col++)); do
    for ((row=0; row<r; row++)); do
      [[ $row -lt ${#grid[@]} ]] || continue
      result+="${grid[row]:col:1}"
    done
    result+=" "
  done

  # 5. trim trailing space and output
  echo "${result% }"
}

main "$@"
