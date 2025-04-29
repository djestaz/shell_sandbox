#!/bin/env sh

APP="Demo Remote"
export HOSTING_NAME=$(hostname)

variables() {
  NSAPP=$(echo "${APP,,}" | tr -d ' ') 
  HOST_NAME=$(hostname)
}