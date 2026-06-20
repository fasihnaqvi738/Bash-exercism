#!/usr/bin/env bash

if (( $# != 2 )); then
  echo "2 arguments expected"
  exit 1
fi

start=$1
end=$2

if (( start > end )); then
  echo "Start must be less than or equal to End"
  exit 1
fi

animals=(
fly spider bird cat dog goat cow horse
)

line1=(
"I know an old lady who swallowed a fly."
"I know an old lady who swallowed a spider."
"I know an old lady who swallowed a bird."
"I know an old lady who swallowed a cat."
"I know an old lady who swallowed a dog."
"I know an old lady who swallowed a goat."
"I know an old lady who swallowed a cow."
"I know an old lady who swallowed a horse."
)

reactions=(
""
"It wriggled and jiggled and tickled inside her."
"How absurd to swallow a bird!"
"Imagine that, to swallow a cat!"
"What a hog, to swallow a dog!"
"Just opened her throat and swallowed a goat!"
"I don't know how she swallowed a cow!"
""
)

chain=(
""
"She swallowed the spider to catch the fly."
"She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
"She swallowed the cat to catch the bird."
"She swallowed the dog to catch the cat."
"She swallowed the goat to catch the dog."
"She swallowed the cow to catch the goat."
""
)

for ((i=start-1; i<end; i++)); do
  echo "${line1[i]}"

  if [[ "${animals[i]}" == "horse" ]]; then
    echo "She's dead, of course!"
  else
    [[ -n "${reactions[i]}" ]] && echo "${reactions[i]}"

    for ((j=i; j>0; j--)); do
      echo "${chain[j]}"
    done

    echo "I don't know why she swallowed the fly. Perhaps she'll die."
  fi

  if (( i < end-1 )); then
    echo
  fi
done