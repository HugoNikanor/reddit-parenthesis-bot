#!/bin/bash
#parent="$(jq -r '.data.children[0].data.name' $HOME/tmp/comments.json)"
parent=$1
text=$2
curl \
	-H "Authorization: bearer $(jq -r '.access_token' oauth_key.json)" \
	-A "Parnenthesis by HugoNikanor" \
	-d "parent=$parent" \
	-d "text=$text" \
	https://oauth.reddit.com/api/comment

