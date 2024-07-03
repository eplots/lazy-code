#!/usr/bin/env bash

# One-liner to convert all *.png to *.webp
for x in ls *.png; do cwebp -q 80 $x -o ${x%.png}.webp; done
