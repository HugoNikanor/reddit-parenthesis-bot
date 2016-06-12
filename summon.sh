#!/bin/bash

# 1. Get inbox / done in get-inbox.sh, called from bot.sh
# 2. Get all entries where subject="username mention" / done in get-inbox.sh
# 3. If parent is 't1', check parent
# 	1. Check parent, if contains unclosed parenthesises, note how many
# 4.1. If parent was t1 and contained unclosed parenthesises, close them per normal
# 4.2. If not '4.1', then instead complain and open a parenthesis

length=$(jq '. | length' "/tmp/${1:=0}-filtered-inbox.json")

for x in $(seq 0 $(($length - 1))); do
	[ `jq -r .[].parent_id' $file \
	  | cut -c 1-2`
	 == "t3" ] \
	&& bad="true" \
	|| # get parent comment, check it
	   # if parent comment contains parenthesis, count and comment
	   # else, set $bad to true
	
	[ $bad ] \
		&& 
