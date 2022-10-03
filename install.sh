#!/bin/bash


#Update & clean up OS

echo
echo "###############################"
echo "RDNSX-Unattended-Upgrades Setup"
echo "###############################"
echo
echo
echo "Updating OS..."
echo
echo
apt update && apt upgrade -y && apt autoremove -y

#Install and placing unattended-upgrades config files

echo
echo
echo "Installing Unattended-Upgrades..."
echo
echo
apt install unattended-upgrades -y
echo
echo
echo "Placing config files..."
echo
echo
cp 50unattended-upgrades /etc/apt/apt.conf.d/50unattended-upgrades
cp 20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades
systemctl restart unattended-upgrades
echo
echo "###########"
echo "## DONE! ##"
echo "###########"
echo
