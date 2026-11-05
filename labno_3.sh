#!/bin/bash

while true; do
    echo -e "\n=== MENU ===\n1) Disk Check\n2) Uptime\n3) Check Time\n4) Quit"
    read -p "Choice [1-4]: " c

    case $c in
        1) df -P | head -n 3 ;;
        2) uptime ;;
        3) date ;;
        4) break ;;
        *) echo "Invalid input! Usage: 1 to 4." ;;
    esac
done
