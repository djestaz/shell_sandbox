#!/usr/bin/env bash

# source <(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/misc/build.func)
source ../../more_scripts/sandbox/global_settings.sh

remove_users() {

  # Loop through each user in the associative array
  for username in "${!USERS[@]}"; do
      echo "username: ${username}"

      if [ $username = "root" ]; then
        echo "Username $username is ROOT, skipping."
        echo "----"
        continue
      fi


  done
}
remove_users

