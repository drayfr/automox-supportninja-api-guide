#!/bin/bash

echo "Select function to execute:"
echo "1) Devices"
echo "2) Packages"
echo "3) Worklets"
echo "4) Groups"
read -rp "Enter choice: " choice

case "$choice" in
  1)
    source ./devices.sh
    ;;
  2)
    source ./packages.sh
    ;;
  3)
    source ./worklets.sh
    ;;
  4)
    source ./groups.sh
    ;;
  *)
    echo "Invalid"
    exit 1
    ;;
esac
