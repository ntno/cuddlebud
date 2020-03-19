#!/bin/bash

PROJECT_SECRET_PREFIX="cuddle-bot"
secrets_response=$(aws ssm get-parameters --names \
    "/$PROJECT_SECRET_PREFIX/BLOG_NAME" \
    "/$PROJECT_SECRET_PREFIX/TUMBLR_OAUTH_CONSUMER_KEY" \
    "/$PROJECT_SECRET_PREFIX/TUMBLR_OAUTH_SECRET_KEY" \
    "/$PROJECT_SECRET_PREFIX/DISCORD_WEBHOOK"
)

exportSecret () {
    export $1=$(echo $secrets_response | jq -r --arg key "$2" '.Parameters[] | select(.Name == $key).Value')
}

exportSecret "BLOG_NAME" "/$PROJECT_SECRET_PREFIX/BLOG_NAME"
exportSecret "TUMBLR_OAUTH_CONSUMER_KEY" "/$PROJECT_SECRET_PREFIX/TUMBLR_OAUTH_CONSUMER_KEY"
exportSecret "TUMBLR_OAUTH_SECRET_KEY" "/$PROJECT_SECRET_PREFIX/TUMBLR_OAUTH_SECRET_KEY"
exportSecret "DISCORD_WEBHOOK" "/$PROJECT_SECRET_PREFIX/DISCORD_WEBHOOK"
