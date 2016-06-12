#!/bin/bash

source last-check.sh

curl \
	-H "Authorization: bearer $(./get-oauth-key.sh)" \
	-A "Parnenthesis by HugoNikanor" \
	https://oauth.reddit.com/message/inbox \
	| jq \
		[ \
			'.data.children[] \
			| select( \
				(.data.subject | contains("username mention")) and \
				.created_utc > ${lastCheck:=0})
		]' \
	> /tmp/${1:=0}-filtered-inbox.json
