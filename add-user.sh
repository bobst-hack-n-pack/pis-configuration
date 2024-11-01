#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install passwd -y 
which useradd chpasswd usermod

# Check if the username and password are provided as arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 <username> <password>"
  exit 1
fi

# Get the username and password from the arguments
username=$1
password=$2

# Create the user with a home directory and bash as the default shell
/usr/sbin/useradd -m -s /bin/bash "$username"

# Set the user's password
echo "$username:$password" | /usr/sbin/chpasswd

# Add the user to the sudo group 
/usr/sbin/usermod -aG sudo "$username"

echo "User '$username' created with admin rights."
