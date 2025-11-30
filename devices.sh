#!/bin/bash

source ./config.sh
source ./getAPI.sh
source ./api.sh

# Prompt for command type
echo "Select function to execute:"
echo "1) getDevices"
echo "2) getDeviceByID"
echo "3) getSoftwarePackagesPerDevice"
echo "4) upQueueByDevice(Reboot)"
echo "5) upQueueByDevice(InstallUpdate)"
echo "6) issueCommandToDevice"
echo "7) getDeviceInventory"
echo "8) getDeviceInventoryCategories"
read -rp "Enter choice: " choice

# specificDevice "Reboot"
# specificDevice "InstallUpdate" "patch-1,patch-2"

case "$choice" in
  1)
    getDevices | jq
    ;;
  2)
    read -rp "Enter the device ID (Default: 6109755)" -a device
    # Call function with command type and patches
    getDeviceByID "${device[@]}" | jq
    ;;
  3)
    read -rp "Enter the device ID (Default: 6109755)" -a device
    # Call function with command type and patches
    getSoftwarePackagesByDevice "${device[@]}" | jq
    ;;
  4)
    read -rp "Enter the device ID (Default: 6109755): " device
    upQueueByDevice "$device" "Reboot" | jq
    ;;
  5)
    read -rp "Enter the device ID (Default: 6109755): " device
    read -rp "Enter patch names separated by spaces (e.g. patch-1 patch-2): " -a patches
    # Call function with command type and patches
    upQueueByDevice "$device" "InstallUpdate" "${patches[@]}" | jq
    ;;
  6)
    read -rp "Enter the device ID (Default: 6109755): " device
    read -rp "Enter the command type(GetOS, InstallUpdate, InstallAllUpdates, Reboot): " command

    if [[ "$command" == "InstallUpdate" ]]; then
        read -rp "Enter patch names separated by spaces (e.g. patch-1 patch-2): " -a patches
        issueCommandToDevice "$device" "$command" "${patches[@]}"
    else
        # For other commands, no patches needed
        issueCommandToDevice "$device" "$command"
    fi
    ;;
  7)
    read -rp "Enter the device UUID(Default: 1fbab112-db86-4876-a89c-a70648a11c26): " device
    read -rp "Enter the category(Enum: "Hardware" "Health" "Network" "Security" "Services" "Summary" "System" "Users"): " category

    getDeviceInventory "$device" "$category" | jq
    ;;
  8)
    read -rp "Enter the device UUID(Default: 1fbab112-db86-4876-a89c-a70648a11c26): " device
    getDeviceInventoryCategories "$device" | jq
    ;;
  *)
    echo "Invalid choice"
    exit 1
    ;;
esac
