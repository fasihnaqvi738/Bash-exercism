#!/usr/bin/env bash

#!/usr/bin/env bash

sentence=$(echo "$*" | tr '[:upper:]' '[:lower:]')

for letter in {a..z}; do
    if [[ $sentence != *"$letter"* ]]; then
        echo "false"
        exit 0
    fi
done

echo "true"