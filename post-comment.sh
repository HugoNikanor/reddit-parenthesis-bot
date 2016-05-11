#!/bin/bash
parent="$(jq -r '.data.children[0].data.name' $HOME/tmp/comments.json)"
curl \
	-H "Authorization: bearer $(jq -r '.access_token' oauth_key.json)" \
	-A "Parnenthesis by HugoNikanor" \
	-d "parent=$parent" \
	-d "text=This is a test responce" \
	https://oauth.reddit.com/api/comment

