#!/bin/bash
input="$(cat /dev/stdin)"
echo $(( $(grep -o '(' <<< "$input" | wc -l) - $(grep -o ')' <<< $input | wc -l) ))
