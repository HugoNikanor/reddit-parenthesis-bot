jq '.data.children[] | select(.data.subject | contains("username mention"))' ~/tmp/inbox.json
