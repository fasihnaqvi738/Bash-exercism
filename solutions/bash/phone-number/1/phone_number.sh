#!/usr/bin/env bash

input="$1"

# Keep only digits
number=$(echo "$input" | tr -cd '0-9')

# Remove leading country code
if [[ ${#number} -eq 11 && ${number:0:1} == "1" ]]; then
    number=${number:1}
fi

invalid() {
    echo "Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9"
    exit 1
}

# Must be exactly 10 digits now
[[ ${#number} -eq 10 ]] || invalid

# Area code must start 2-9
[[ ${number:0:1} =~ [2-9] ]] || invalid

# Exchange code must start 2-9
[[ ${number:3:1} =~ [2-9] ]] || invalid

echo "$number"
