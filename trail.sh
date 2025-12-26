#!/bin/bash

source ./config.sh
source ./getAPI.sh

echo "Select function to execute:"
echo "1) Audit Trail"
read -rp "Enter choice: " choice

case "$choice" in
  1)
    read -rp "Enter the event date (Default: 2025-12-02): " event
    getAuditTrail "$event"
    # getAuditTrail "$event" | jq '.data[] | .observables[] | select(.name=="email") | .value'
    \n\n
    ;;
esac