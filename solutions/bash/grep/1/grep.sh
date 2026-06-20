#!/usr/bin/env bash

while getopts ":nli vx" opt; do
  case "$opt" in
    n) nflag=1 ;;
    l) lflag=1 ;;
    i) iflag=1 ;;
    v) vflag=1 ;;
    x) xflag=1 ;;
  esac
done

shift $((OPTIND - 1))

pattern=$1
shift
files=("$@")

(( iflag )) && pattern=$(printf '%s' "$pattern" | tr '[:upper:]' '[:lower:]')

out=()

for file in "${files[@]}"; do
  matched_file=0
  lineno=0

  while IFS= read -r line || [[ -n "$line" ]]; do
    ((lineno++))

    text=$line
    (( iflag )) && text=$(printf '%s' "$text" | tr '[:upper:]' '[:lower:]')

    match=0

    if (( xflag )); then
      [[ "$text" == "$pattern" ]] && match=1
    else
      [[ "$text" == *"$pattern"* ]] && match=1
    fi

    (( vflag )) && ((match==1)) && match=0 && continue
    (( vflag )) && ((match==0)) && match=1

    if (( match )); then
      matched_file=1

      if (( lflag )); then
        out+=("$file")
        break
      fi

      line_out=""

      if (( ${#files[@]} > 1 )); then
        line_out+="$file:"
      fi

      if (( nflag )); then
        line_out+="$lineno:"
      fi

      line_out+="$line"
      out+=("$line_out")
    fi

  done < "$file"

done

printf "%s\n" "${out[@]}"
