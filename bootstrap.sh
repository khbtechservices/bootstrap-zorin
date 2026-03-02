#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run with sudo"
  exit 1
fi

# --------------------------------
# Setup Variables
# --------------------------------
BGCYAN='\033[0;106m'
FGCYAN='\033[0;96m'
FGBLACK='\033[0;30m'
BGGREEN='\033[0;42m'
RESET='\033[0m'

set -e

# Update System
echo -e " ${BGCYAN}${FGBLACK} UPDATE ${RESET} Updating & Upgrading System"
apt update &&  apt upgrade -y

# Install SSH
echo -e " ${BGCYAN}${FGBLACK} SSH ${RESET} Installing SSH"
apt install -y openssh-server
echo -e " ${BGCYAN}${FGBLACK} SSH ${RESET} Enabling SSH"
systemctl enable ssh
systemctl start ssh

# Install vim
echo -e " ${BGCYAN}${FGBLACK} VIM ${RESET} Installing VIM"
apt install -y vim

echo -e " ${BGGREEN}${FGBLACK} DONE! ${RESET} Done!"