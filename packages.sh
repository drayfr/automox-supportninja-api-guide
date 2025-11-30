#!/bin/bash

source ./config.sh
source ./getAPI.sh

echo "Select function to execute:"
echo "1) getSoftwarePackagesByDevice"
echo "2) getSoftwarePackagesForAllDevices"
read -rp "Enter choice: " choice

case "$choice" in
  1)
    read -rp "Enter the device ID (Default: 6109755)" -a device
    # Call function with command type and patches
    getSoftwarePackagesByDevice "${device[@]}" | jq
    ;;
  2)
    getSoftwarePackagesForAllDevices
esac