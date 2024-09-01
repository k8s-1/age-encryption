#!/bin/bash

# ensure default directory exists
mkdir -p ~/.config/age

# append new keypair to keys.txt
age-keygen >> ~/.config/age/keys.txt
