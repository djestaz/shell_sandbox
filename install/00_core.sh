#!/usr/bin/env bash

ESC_CODE="\033["
ESC_RESET="0m"

cecho() {
	case "$1" in
    black  | bk) colour="30m"; shift;;
    red    |  r) colour="31m"; shift;;
    yellow |  y) colour="33m"; shift;;
    green  |  g) colour="32m"; shift;;
    blue   |  b) colour="34m"; shift;;
    purple |  p) colour="35m"; shift;;
    cyan   |  c) colour="36m"; shift;;
    white  |  w) colour="37m"; shift;;
    default|  *) colour="39m";;
  esac
  case "$1" in 
    bold   | bo) bold="1"; shift;;
              *) bold="0";;
  esac
  msg="$*"
  # echo "${ESC_CODE}${bold};${colour}$msg${ESC_CODE}${ESC_RESET}"
  echo -e "${ESC_CODE}${bold};${colour}$msg${ESC_CODE}${ESC_RESET}"
}
text() {
  cecho "$@"
}
header() {
  colour="$1"; shift
  text "$colour" 'bold' "$@"
}
info() {
  text 'c' "$@"
}
header_info() {
  header 'c' "$@"
}
header_info "INFO"
success() {
  text 'g' "$@"
}
header_success() {
  header 'g' "$@"
}
warning() {
  text 'y' "$@"
}
header_warning() {
  header 'y' "$@"
}
error() {
  text 'r' "$@"
}
header_error() {
  header 'r' "$@"
}

daysSinceAptUpdateRan() {
  aptDate="$(stat -c %Y '/var/cache/apt')"
  nowDate="$(date +'%s')"
  ts=$((nowDate - aptDate))
  days=$((ts/60/60/24))
  echo $days
}

updateAptIndexesAndPackages() {
  header_info "Indexes and Installed Packages"
  days=$(daysSinceAptUpdateRan)
  if [[ $days -ge 6 ]];then
    warning "$days since last update.  Updating..."
  else
    info "Update not required just yet..."
  fi
}

updateAptIndexesAndPackages