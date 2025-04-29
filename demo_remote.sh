#!/bin/env sh

APP="Demo Remote"

variables() {
  NSAPP=$(echo "${APP,,}" | tr -d ' ') 
  HOST_NAME=$(hostname)
}