#!/usr/bin/env bash

planet=$1
seconds=$2

earth_year=31557600

case "$planet" in
    Mercury) factor=0.2408467 ;;
    Venus) factor=0.61519726 ;;
    Earth) factor=1.0 ;;
    Mars) factor=1.8808158 ;;
    Jupiter) factor=11.862615 ;;
    Saturn) factor=29.447498 ;;
    Uranus) factor=84.016846 ;;
    Neptune) factor=164.79132 ;;
    *)
        echo "$planet is not a planet"
        exit 1
        ;;
esac

awk -v s="$seconds" -v e="$earth_year" -v f="$factor" '
BEGIN {
    printf "%.2f\n", s / (e * f)
}'
