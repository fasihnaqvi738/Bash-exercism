#!/usr/bin/env bash

ordinals=(
    first second third fourth fifth sixth
    seventh eighth ninth tenth eleventh twelfth
)

gifts=(
    "a Partridge in a Pear Tree."
    "two Turtle Doves"
    "three French Hens"
    "four Calling Birds"
    "five Gold Rings"
    "six Geese-a-Laying"
    "seven Swans-a-Swimming"
    "eight Maids-a-Milking"
    "nine Ladies Dancing"
    "ten Lords-a-Leaping"
    "eleven Pipers Piping"
    "twelve Drummers Drumming"
)

start=$1
end=$2

for ((day=start; day<=end; day++)); do
    verse="On the ${ordinals[day-1]} day of Christmas my true love gave to me: "

    for ((gift=day; gift>=1; gift--)); do
        if (( gift == 1 )); then
            if (( day == 1 )); then
                verse+="${gifts[0]}"
            else
                verse+="and ${gifts[0]}"
            fi
        else
            verse+="${gifts[gift-1]}, "
        fi
    done

    echo "$verse"
done
