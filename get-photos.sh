#!/bin/bash

curl api.tumblr.com/v2/blog/${BLOG_NAME}/posts/photo?api_key=${TUMBLR_OAUTH_CONSUMER_KEY} > temp.json
cat temp.json | jq . > $1
rm temp.json
