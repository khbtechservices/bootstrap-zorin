#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run with sudo"
  exit 1
fi

set -e

# Update System
apt update &&  apt upgrade -y

# Install SSH
apt install -y openssh-server
systemctl enabl ssh
systemctl start ssh

# Install vim
apt install -y vim
