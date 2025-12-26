#!/bin/bash

source ./config.sh
source ./getAPI.sh
source ./api.sh
source ./putAPI.sh

echo "Select function to execute:"
echo "1) List all group objects"
echo "2) List specific group object"
echo "3) Creates a new server group"
echo "4) Update an existing server group"
read -rp "Enter choice: " choice

case "$choice" in
  1)
    getAllGroups | jq
    ;;
  2)
    read -rp "Enter the group ID (Default Sample: "341893")" -a group
    getSpecificGroupByID "$group" | jq
    ;;
  3)
    read -rp "Enter the group name: " -a name
    read -rp "Enter the refresh interval (240..1440): " -a refresh_interval
    createGroup "$name" $refresh_interval | jq
    ;;
  4)
    read -rp "Enter the group ID: " -a group
    read -rp "Enter the group name: " -a name
    read -rp "Enter the refresh interval (240..1440, Default: 1440): " -a refresh_interval
    updateGroupById "$group" "$name" $refresh_interval | jq
    ;;
esac

# Todo:
# DELETE: Deletes a server group
# 
