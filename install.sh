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
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
echo
echo
echo "DONE!"