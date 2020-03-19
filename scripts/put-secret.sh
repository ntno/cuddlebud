#!/bin/bash

PROJECT_SECRET_PREFIX="cuddle-bot"
DEFAULT_TAGS="[{\"Key\":\"project\",\"Value\":\"cuddle-bot\"},{\"Key\":\"domain\",\"Value\":\"personal\"}]"
putSecret () {
    aws ssm put-parameter --cli-input-json \
        "{\"Name\": \"/$PROJECT_SECRET_PREFIX/$1\",\"Value\":\"$2\",\"Type\":\"String\",\"Overwrite\":true}"
    
    aws ssm add-tags-to-resource \
        --resource-id "/$PROJECT_SECRET_PREFIX/$1" \
        --resource-type "Parameter" \
        --tags $DEFAULT_TAGS 
}
export -f putSecret