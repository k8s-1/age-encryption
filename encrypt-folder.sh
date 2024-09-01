#!/bin/bash

# Encrypt a dir with age key-pair

set -eux

dir="$1"

stat "./$dir" # verify dir exists

mkdir -p ~/.config/age

age-keygen >> ~/.config/age/keys.txt

pubkey=$(grep -oP '(?<=public key: ).*' ~/.config/age/keys.txt | tail -n 1)

tar cvz "./$dir" | age -r "$pubkey" --armor | tee "./$dir.tar.gz.age"

echo "encryption complete of ./$dir to ./$dir.tar.gz.age... safe to remove ./$dir"
