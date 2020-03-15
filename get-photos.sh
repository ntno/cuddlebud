#!/bin/bash

curl "api.tumblr.com/v2/blog/${BLOG_NAME}/posts/photo?api_key=${TUMBLR_OAUTH_CONSUMER_KEY}&limit=20&offset=$2" > temp.json
cat temp.json | jq . > $1
rm temp.json
