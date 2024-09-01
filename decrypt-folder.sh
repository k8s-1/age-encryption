#!/bin/bash

# Encrypt a dir with age key-pair

set -eux

dir_encrypted="$1" # dirname.tar.gz.age

dir_zipped="${dir_encrypted%.age}" 

stat "./$dir_encrypted" # verify dir exists

age --decrypt -i ~/.config/age/keys.txt -o "${dir_zipped}" "${dir_encrypted}"

tar -xzv "$dir_zipped"

echo "decryption complete of ./${dir_encrypted}..."
