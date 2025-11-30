#!/bin/bash

# https://developer.automox.com/openapi/axconsole/operation/getDevices/
getDevices() {
  # Default values if not set
  # local groupID="${groupID:-0}"
  # local psVersion="${PS_VERSION:-0}"
  # local org="${orgID:-0}"
  # local pending="${pending:-0}"
  # local patchStatus="${patchStatus:-missing}"
  # local policy="${policyId:-0}"
  # local exception="${exception:-0}"
  # local managed="${managed:-0}"
  # local limit="${limit:-500}"
  # local page="${page:-0}"
  # local isCompatible="${isCompatible:-true}"
  # local sortColumn="${sortColumn:-is_compatible}"
  # local sortDir="${sortDir:-asc}"
  # local includeDetails="${include_details:-0}"
  # local includeEvents="${include_server_events:-0}"
  # local includeNextPatch="${include_next_patch_time:-0}"
  # local excludePolicy="${exclude_policy_status:-0}"

  # URL-encode brackets for filters and sortColumns
  local param="servers?groupId=$groupID&PS_VERSION=$PS_VERSION&o=$orgID"

  curl -v X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}

# https://developer.automox.com/openapi/axconsole/operation/getServer/
getDeviceByID() {
  local device_id="${1:-$serverID}"

  local param="servers/$device_id?o=$orgID&PS_VERSION=0&include_details=0&include_server_events=0&include_next_patch_time=0&exclude_policy_status=0"

  curl -v X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}

# https://developer.automox.com/openapi/axconsole/operation/getDevicePackages/
getSoftwarePackagesByDevice() {
  local device_id="${1:-$serverID}"

  local param="servers/$device_id/packages?o=$orgID&page=0&limit=500"

  curl -v X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}

# https://developer.automox.com/openapi/axconsole/operation/getOrganizationPackages/
getSoftwarePackagesForAllDevices() {
  local param="orgs/$orgID/packages?includeUnmanaged=0&awaiting=0&page=0&limit=500"

  curl -v X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}

# https://developer.automox.com/openapi/axconsole/operation/getDeviceQueues/
upQueueByDevice() {
  local device_id="${1:-$serverID}"
  local commandType="$2"
  local payload="{\"command_type_name\": \"$commandType\"}"

  local param="servers/$device_id/queues?o=$orgID"

  curl -v -X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader" \
    -d "$payload"
}

# https://developer.automox.com/openapi/axconsole/operation/getDeviceInventory/
getDeviceInventory() {
  local device_uuid="${1:-$serverUUID}"
  local category="$2"

  # Category Enum: "Hardware" "Health" "Network" "Security" "Services" "Summary" "System" "Users"
  local param="device-details/orgs/$orgUUID/devices/$device_uuid/inventory?category=$category"

  curl -v -X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}


getDeviceInventoryCategories() {
  local device_uuid="${1:-$serverUUID}"

  # Category Enum: "Hardware" "Health" "Network" "Security" "Services" "Summary" "System" "Users"
  local param="device-details/orgs/$orgUUID/devices/$device_uuid/categories"

  curl -v -X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}

# https://developer.automox.com/openapi/axconsole/operation/searchWorklets/
searchWorklets() {
  # https://console.automox.com/api/wis/search?q=string&page=0&limit=25&sort=create_time%3Aasc&category=Data%20Collection%20%26%20Auditing&os_family=Windows&device_type=WORKSTATION&newly_added=false' \
  # Edit the query based on use case/needs

  local param="wis/search?q=string&page=0&limit=25&os_family=Mac&device_type=server"

  curl -s -X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}

# https://developer.automox.com/openapi/axconsole/operation/searchWorkletsById/
searchWorkletsByUUID() {
  local worklet_uuid="${1:-$workletUUID}"
  local param="wis/search/$worklet_uuid"

    curl -s -X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}

# https://developer.automox.com/openapi/axconsole/operation/getServerGroups/
getAllGroups() {
  local param="servergroups?o=$orgID&page=0&limit=500"

  curl -v -X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}

# https://developer.automox.com/openapi/axconsole/operation/createServerGroup/
getSpecificGroupByID() {
  local group_id="${1:-$grolupID}"
  local param="servergroups/$group_id?o=$orgID"

  curl -v -X GET \
    "$apiBaseURL/$param" \
    -H "$authHeader" \
    -H "$contentHeader"
}
