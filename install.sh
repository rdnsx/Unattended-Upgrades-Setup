#!/bin/bash

echo
echo "###############################"
echo "RDNSX-Unattended-Upgrades Setup"
echo "###############################"
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
echo "###########"
echo "## DONE! ##"
echo "###########"
echo
