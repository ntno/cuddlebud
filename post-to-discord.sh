#!/bin/bash
#$1 - pass payload file location

curl -X POST ${DISCORD_WEBHOOK} -d @$1 --header  "Content-Type: application/json"
