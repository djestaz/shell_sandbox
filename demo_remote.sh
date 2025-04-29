#!/bin/env sh

set -e

APP="Demo Remote"
export HOSTING_NAME=$(hostname)

variables() {
  NSAPP=$(echo "${APP,,}" | tr -d ' ') 
  HOST_NAME=$(hostname)
}

servers=("google.com" "netflix.com" "localhost:1234")


for item in "${servers[@]}"; do
    # Use the 'ping' command and redirect both STDOUT and STDERR to the 'response' variable
    response=$(ping -c 1 "$item" -t 1 2>&1 || true)

    # The condition is based on what we consider a successful response
    if echo "$response" | grep "1 packets transmitted, 1 packets received, 0.0% packet loss" 1>/dev/null 2>/dev/null ; then
        echo "
SUCCESS :: ${item}
--------------------------------------------------------------
${response}
--------------------------------------------------------------"
    else
        echo "
ERROR :: ${item}
--------------------------------------------------------------
${response}
--------------------------------------------------------------"
    fi
done
