#!/bin/bash

sudo apt-get update
sudo apt-get install figlet
# Print a fancy ASCII art banner
figlet -f big "BOBST"
figlet "IoT -  Hack 'n' Pack"

# Update and upgrade
sudo apt update
sudo apt upgrade -y

# Install system packages with apt
sudo apt install -y python3-pip python3-rpi.gpio

# Check if asyncio is already installed
if ! python3 -c "import asyncio"; then
  echo "asyncio not found. Please make sure you have a valid Python 3 installation."
  exit 1
fi

# Create a virtual environment
python3 -m venv my_venv
source my_venv/bin/activate

# Install remaining packages with pip in the virtual environment
pip install azure-iot-device flask flask-cors black

deactivate  # Deactivate the virtual environment when done
