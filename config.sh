#!/bin/bash

apiBaseURL="https://console.automox.com/api"
orgID="122997"
orgUUID="21cb281b-e243-4b9c-bef1-bfa56a814cd2"
serverID="6109755"
serverUUID="1fbab112-db86-4876-a89c-a70648a11c26"
groupID="341893"


workletUUID="0637bf85-4372-5ac8-9a4b-3af6259c7b26"

# Load environment variables
if [ -f .env ]; then
    source .env
else
    echo ".env file not found!"
    exit 1
fi

authHeader="Authorization: Bearer $token"
orgHeader="ax-organization-uuid: $orgUUID"
contentHeader="Content-Type: application/json"

defaultEventDate="2025-12-02"