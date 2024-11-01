#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Check if the correct number of arguments are provided
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <username> <password>"
  exit 1
fi

# Get the username and password from the arguments
username=$1
password=$2

# Create the user with a home directory and bash as the default shell
useradd -m -s /bin/bash "$username"

# Set the user's password
echo "$username:$password" | chpasswd

# Add the user to the sudo group to grant admin rights
usermod -aG sudo "$username"

echo "User '$username' created successfully with admin rights."
