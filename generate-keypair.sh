#!/bin/bash

set -eux

mkdir -p ~/.config/age

age-keygen >> ~/.config/age/keys.txt
