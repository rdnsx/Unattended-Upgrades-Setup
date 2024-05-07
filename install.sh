#!/bin/bash

echo "Updating OS..."
echo
echo
apt update && apt upgrade -y && apt autoremove -y
echo
echo
echo "Installing Unattended-Upgrades..."
echo
echo
{
apt install unattended-upgrades -y
} &> /dev/null
echo
echo
echo "Placing config files..."
echo
echo
{
cp 50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades
cp 20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
systemctl restart unattended-upgrades
} &> /dev/null
echo
echo
echo "Replacing Docker repository..."
echo
echo
apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
apt install -y docker.io
echo
echo "DONE!"