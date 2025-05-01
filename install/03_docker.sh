#!/usr/bin/env sh

# Exit immediately if a command exits with a non-zero status
set -e

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Update the package database
echo "Updating system andpwd packages..."
apt-get update && apt-get upgrade -y

echo "Removing obsolete packages"

PACKAGES=("docker.io" "docker-doc" "docker-compose" "docker-compose-v2" "podman-docker" "containerd" "runc")

## now loop through the above array
for i in "${PACKAGES[@]}"
do
   echo "$i"
   # or do whatever with individual element of the array
done
# for pkg in "${PACKAGES}"; do

#   echo -e "2 ${pkg}\n"
# done

# dpkg-query --show --showformat='${Status}' $PACKAGE_NAME


# output=['a.txt', 'b.txt', 'c.txt', 'd.txt']

# for i in output; do
#     echo $i  
# done

# output='a.txt b.txt c.txt d.txt'
output='docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc'
for pkg in $output; do
  #  echo "$pkg"  # remember quotes here
  #  $(dpkg-query --show --showformat='${Status}' $pkg) &> /dev/null
  if dpkg -s "$pkg" &>/dev/null; then
    echo "$pkg is installed"
  else
    echo "$pkg not installed"
  fi
done
