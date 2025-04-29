#!/bin/env sh

APP="Demo Remote"
HOSTING_NAME=$(hostname)

variables() {
  NSAPP=$(echo "${APP,,}" | tr -d ' ') 
  HOST_NAME=$(hostname)
}