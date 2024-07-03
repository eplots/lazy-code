#!/usr/bin/env bash

# Store destination paths in variables
nasty="eplots@192.168.50.212:~/NASty/hackz"

# Parse directory path to get directory name only and store it in a variable
dir="$(basename $2)"

# If $1 variable equals "NASty", format SCP to copy dir ($2) to NASty:
[ "$1" == nasty ] && scp -P 1886 -r "$2" "$nasty"/"$dir"
