#!/bin/bash
source user-secrets.sh
curl \
	-X POST \
	-A "Parnenthesis by HugoNikanor" \
	-d 'grant_type=password' \
	-d 'username=parenthesis-bot' \
	-d "password=$password" \
	--user "$user" \
	https://www.reddit.com/api/v1/access_token \
	> oauth_key.json
