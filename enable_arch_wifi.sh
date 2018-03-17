#!/bin/bash

echo " Installing Tools for Wifi Support"
sudo pacman -Sy wpa_supplicant
sudo pacman -Sy wireless_tools
sudo pacman -Sy networkmanager
sudo pacman -Sy network-manager-applet
sudo pacman -Sy gnome-keyring

echo " Enabling Network Manager Service"
sudo systemctl enable NetworkManager.service

echo " Disabling DHCPCD Services"
sudo systemctl disable dhcpcd.service
sudo systemctl disable dhcpcd@.service
sudo systemctl stop dhcpcd.service
sudo systemctl stop dhcpcd@.service

echo " Enabling WPA and adding network to Group"
sudo systemctl enable wpa_supplicant.service
sudo gpasswd -a gourav1607 network

echo " Disabling current connections"
sudo ip link set down eno1
sudo ip link set down wlo1

echo " Starting Wifi Services"
sudo systemctl start wpa_supplicant.service
sudo systemctl start NetworkManager.service

