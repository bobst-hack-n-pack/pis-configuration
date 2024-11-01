#!/bin/bash

# Update the package list
sudo apt update

# Upgrade existing packages
sudo apt upgrade -y

# Install main application requirements
sudo apt install -y python3-pip python3-asyncio python3-rpi.gpio

# Install Azure IoT Device SDK for Python
pip install azure-iot-device

# Install Flask API requirements
pip install flask flask-cors

# Install formatting tool
pip install black
