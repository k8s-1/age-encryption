#!/bin/bash

set -eux

dir="$1"

# remove trailing slash if exists
dir="${dir%/}"

stat "./$dir" # verify dir exists

pubkey=$(grep -oP '(?<=public key: ).*' ~/.config/age/keys.txt | tail -n 1)

dir_encrypted="$dir.tar.gz.age"

tar cvz "./$dir" | age -r "$pubkey" --armor | tee "./$dir_encrypted"

echo "encryption complete of ./$dir to ./$dir_encrypted... safe to remove ./$dir"
