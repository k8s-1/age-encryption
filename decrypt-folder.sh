#!/bin/bash

set -eux

dir_encrypted="$1"

if [[ "$dir_encrypted" == *.tar.gz.age ]]; then
    :
else
    echo "The directory name does not end with .tar.gz.age"
    exit 1
fi

stat "./$dir_encrypted"

dir_zipped="${dir_encrypted%.age}" 

age --decrypt -i ~/.config/age/keys.txt -o "${dir_zipped}" "${dir_encrypted}"

tar -xzv "$dir_zipped"

echo "decryption complete of ./${dir_encrypted}..."
