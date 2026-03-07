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
BOLD_DEFAULT='\033[1m'
RESET='\033[0m'

set -e

# Update System
printf "\n${INFO} UPDATE ${RESET} ${BOLD_DEFAULT}Updating & Upgrading System${RESET}"
apt update &&  apt upgrade -y

# Install SSH
printf "\n${INFO} SSH ${RESET} ${BOLD_DEFAULT}Installing SSH${RESET}"
apt install -y openssh-server
printf "\n${INFO} SSH ${RESET} ${BOLD_DEFAULT}Enabling SSH${RESET}"
systemctl enable ssh
systemctl start ssh

# Install vim
printf "\n${INFO} VIM ${RESET} ${BOLD_DEFAULT}Installing VIM${RESET}"
apt install -y vim

# Install rclone
printf "\n${INFO} RCLONE ${RESET} ${BOLD_DEFAULT}Installing rclone${RESET}"
curl https://rclone.org/install.sh | sudo bash

printf "\n${SUCCESS} DONE! ${RESET} ${BOLD_DEFAULT}Done!${RESET}"
