#!/usr/bin/env bash

# To be added to server during commissioning.


main() {
# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Please use sudo or log in as root."
  exit 1
fi

# Update the package database
echo "Updating system andpwd packages..."
apt-get update && apt-get upgrade -y

echo "Installing prerequisites..."
apt-get install -y \
    ca-certificates \
    curl \
    git \
    gnupg \
    lsb-release \
    python3 \
    python3-pip
}

apt autoremove

main