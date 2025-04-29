#!/usr/bin/env sh

main() {
# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Please use sudo or log in as root."
  exit 1
fi

# Update the package database
echo "Updating system packages..."
apt-get update && apt-get upgrade -y

echo "Installing prerequisites..."
apt-get install -y \
    git \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    python3 \
    python3-pip

}

main