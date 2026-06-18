#!/usr/bin/env bash

value() {
    case "$1" in
        black) echo 0 ;;
        brown) echo 1 ;;
        red) echo 2 ;;
        orange) echo 3 ;;
        yellow) echo 4 ;;
        green) echo 5 ;;
        blue) echo 6 ;;
        violet) echo 7 ;;
        grey) echo 8 ;;
        white) echo 9 ;;
        *)
            return 1
            ;;
    esac
}

if ! first=$(value "$1"); then
    echo "invalid color"
    exit 1
fi

if ! second=$(value "$2"); then
    echo "invalid color"
    exit 1
fi

echo $(( first * 10 + second ))