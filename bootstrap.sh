#!/bin/bash
set -e

# Update System
sudo apt update && sudo apt upgrade -y

# Install SSH
sudo apt install -y openssh-server
sudo systemctl enabl ssh
sudo systemctl start ssh

# Install vim
sudo apt install -y vim
