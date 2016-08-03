#!/bin/bash
input="$(cat /dev/stdin)"
echo $(tr -d '\n\r' <<< $input | sed ':loop; s/([^()]*)//g; t loop' | grep -o '(' | wc -l)
