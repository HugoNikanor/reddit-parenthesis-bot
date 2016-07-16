#!/bin/bash
cd /home/parenthesis-bot/parenthesisbot
date >> /tmp/cron-log
./bot.sh parenthesisbot >> /tmp/cron-log

