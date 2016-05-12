#!/bin/bash
source user-secrets.sh
source oauth-death-time.sh

if [ $(date +%s) -gt $oauthDeath ]; then
	curl \
		-X POST \
		-A "bash:paren-bot:v0.1 by /u/hugonikanor" \
		-d 'grant_type=password' \
		-d 'username=parenthesis-bot' \
		-d "password=$password" \
		--user "$user" \
		https://www.reddit.com/api/v1/access_token \
		> oauth_key.json
	"oauthDeath=$(( $(jq '.expries_in' oauth_key.json) + $(date +%s) ))" > oauth-death-time.sh

fi

jq '.access_token' oauth_key.json
