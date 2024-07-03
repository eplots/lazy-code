#!/usr/bin/env bash

# Store destination path in variable
nasty="eplots@192.168.50.212:~/NASty/hackz"

# Parse filepath to get filename only and store in variable
file="$(basename $2)"

# If $1 variable equals "nasty", format SCP to copy file ($2) to NASty:
[ "$1" == nasty ] && scp -P 1886 "$2" "$nasty"/"$file"
