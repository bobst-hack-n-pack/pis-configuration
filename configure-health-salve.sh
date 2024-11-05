#!/bin/bash

# Download app.py in correct folder


sudo echo "[Unit]
Description=Raspberry Pi Slave Monitor
After=network.target

[Service]
ExecStart=/usr/bin/python3 /home/bobst/status-app/app.py
Restart=always
User=bobst

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/slave_monitor.service

sudo systemctl enable slave_monitor.service
sudo systemctl start slave_monitor.service
sudo systemctl status slave_monitor.service

