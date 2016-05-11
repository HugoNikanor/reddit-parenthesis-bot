#!/bin/bash

url="https://www.reddit.com/r/programmerhumor/comments.json"

time=$(date +%s)
rawInputFile="/tmp/$time-comments.json"
filteredInputFile="/tmp/$time-filtered-comments.json"
wget -q -O $rawInputFile $url

source last-check.sh



echo "[" > $filteredInputFile
jq ".data.children[].data | select(.created_utc>$lastCheck)" $file >> $filteredInputFile
echo "]" >> $filteredInputFile

echo "lastCheck=$time" > last-check.sh
