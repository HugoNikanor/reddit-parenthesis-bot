#!/bin/bash

url="https://www.reddit.com/r/programmerhumor/comments.json"

time=$(date +%s)
rawInputFile="/tmp/$time-comments.json"
filteredInputFile="/tmp/$time-filtered-comments.json"
wget -q -O $rawInputFile $url

source last-check.sh


jq "[.data.children[].data | select(.created_utc>$lastCheck)]" $rawInputFile > $filteredInputFile

echo "lastCheck=$time" > last-check.sh

length=$(jq '. | length' $filteredInputFile)

for x in $(seq 0 $(($length - 1))); do
	noP=$(jq ".[$x].body" $filteredInputFile | ./count-paren.sh)
	if [ $noP -gt 0 ]; then
		python -c 'print(")" * $noP)' | ./post-reddit-comment.sh
	fi
done
