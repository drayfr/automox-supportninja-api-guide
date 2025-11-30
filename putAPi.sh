#!/bin/bash

updateGroupById() {
  local groud_id="${1:-$groupID}"
  local name="$2"
  local refresh_interval="$3"
  local parent_server_group_id="341753"

  local param="servergroups/$groud_id?o=$orgID"

  local payload="{\"name\": \"$name\", \"refresh_interval\": \"$refresh_interval\", \"parent_server_group_id\": \"$parent_server_group_id\"}"

  echo $payload

  curl -v -X PUT \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader" \
    -d "$payload"
}