#!/bin/bash

curl -X POST ${WEBHOOK} -d @payload.json --header  "Content-Type: application/json"
