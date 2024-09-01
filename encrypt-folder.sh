#!/bin/bash

# Encrypt a dir with age key-pair

set -eux

dir="$1"

stat "./$dir" # verify dir exists

mkdir -p ~/.config/age

age-keygen >> ~/.config/age/keys.txt

pubkey=$(grep -oP '(?<=public key: ).*' ~/.config/age/keys.txt | tail -n 1)

dir_encrypted="$dir.tar.gz.age"

tar cvz "./$dir" | age -r "$pubkey" --armor | tee "./$dir_encrypted"

echo "encryption complete of ./$dir to ./$dir_encrypted... safe to remove ./$dir"
