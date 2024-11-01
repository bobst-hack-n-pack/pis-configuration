#!/bin/bash

# Update and upgrade
sudo apt update
sudo apt upgrade -y

# Install system packages with apt
sudo apt install -y python3-pip python3-rpi.gpio python3-asyncio 

# Create a virtual environment
python3 -m venv my_venv
source my_venv/bin/activate

# Install remaining packages with pip in the virtual environment
pip install azure-iot-device flask flask-cors black

deactivate  # Deactivate the virtual environment when done
