#!/bin/bash

issueCommandToDevice() {
  local device_id="${1:-$serverID}"
  local commandType="$2"
  shift 2
  local patches=("$@") # remaining arguments

  # Build payload
  local payload="{\"command_type_name\": \"$commandType\"}"
  if [[ "$commandType" == "InstallUpdate" ]] && [ "${#patches[@]}" -gt 0 ]; then
    # Convert Bash array to JSON array
    local patches_str="${patches[*]}"
    payload="{\"command_type_name\": \"$commandType\", \"args\": \"$patches_str\"}"
  fi

  echo "Payload: $payload"

  curl -v -X POST \
    "$apiBaseURL/servers/$device_id/queues?o=$orgID" \
    -H "$authHeader" \
    -H "$contentHeader" \
    -d "$payload"
}

createGroup() {
  local name="$1"
  local refresh_interval="$2"
  local parent_server_group_id="341753"
  local param="servergroups?o=$orgID"

  local payload="{\"name\": \"$name\", \"refresh_interval\": \"$refresh_interval\", \"parent_server_group_id\": \"$parent_server_group_id\"}"

  echo $payload

  curl -s -X POST \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader" \
    -d "$payload"
}