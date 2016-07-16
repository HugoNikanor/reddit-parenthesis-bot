#!/bin/bash
subreddit="parenthesisbot"
cd "/home/parenthesis-bot/$subreddit"
date >> /tmp/cron-log
./bot.sh "$subreddit" >> /tmp/cron-log

