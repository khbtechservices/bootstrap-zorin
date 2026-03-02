#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run with sudo"
  exit 1
fi

# --------------------------------
# Setup Variables
# --------------------------------
INFO='\033[0;30;106m'
SUCCESS='\033[0;30;42m'
RESET='\033[0m'

set -e

# Update System
echo -e " ${INFO} UPDATE ${RESET} Updating & Upgrading System"
apt update &&  apt upgrade -y

# Install SSH
echo -e " ${INFO} SSH ${RESET} Installing SSH"
apt install -y openssh-server
echo -e " ${INFO} SSH ${RESET} Enabling SSH"
systemctl enable ssh
systemctl start ssh

# Install vim
echo -e " ${INFO} VIM ${RESET} Installing VIM"
apt install -y vim

echo -e " ${SUCCESS} DONE! ${RESET} Done!"