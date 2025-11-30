#!/bin/bash

source ./config.sh
source ./getAPI.sh

echo "Select function to execute:"
echo "1) searchWorklets"
echo "2) searchWorkletsByUUID"
read -rp "Enter choice: " choice

case "$choice" in
  1)
    searchWorklets | jq
    ;;
  2)
    read -rp "Enter the worklet uuid (Default Sample: "0637bf85-4372-5ac8-9a4b-3af6259c7b26")" -a worklet
    searchWorkletsByUUID "$device" | jq
esac
