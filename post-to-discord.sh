#!/bin/bash

curl -X POST ${DISCORD_WEBHOOK} -d @payload.json --header  "Content-Type: application/json"
