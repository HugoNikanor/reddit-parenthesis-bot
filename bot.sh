#!/bin/bash


time=$(date +%s)
rawSubreddit="/tmp/$time-comments.json"
filteredComments="/tmp/$time-filtered-comments.json"

rawInbox="/tmp/$time-inbox.json"
filteredInbox="/tmp/$time-filtered-inbox.json"

wget -q -O $rawComments "https://www.reddit.com/r/$1/comments.json"
# get's contents of inbox, and filters it.
# Saves to /tmp/$time-filtered-inbox.json
./get-inbox.sh "$time"

# source last-check.sh

# TODO actually set up that for stuff like this
./subreddit.sh $time
./summon.sh $time

echo "lastCheck=$time" > last-check.sh
