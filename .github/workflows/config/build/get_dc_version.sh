#!/usr/bin/env bash

set -o pipefail

RED='\033[0;31m'
YELLOW='\033[0;33m'
COLORLESS='\033[0m'

print_error() {
  local message="$1"
  echo >&2 -e "${RED}Error:${COLORLESS} ${message}"
}

print_info() {
  local message="$1"
  echo -e "${YELLOW}Info:${COLORLESS} ${message}"
}

if [[ -z ${DC:+null} ]]; then
  print_error "D compiler \`${DC}\` (\"DC\" environment variable) not found."
  exit 1
else
  print_info "DC=${DC}"
fi

dc_version_str="$(${DC} --version)"
last_command_failed=$?

if [[ ${last_command_failed} != 0 ]]; then
  print_error "D compiler \`${DC}\` failed to supply its version."
  exit 2
fi

dc_version_line_str="$(echo "${dc_version_str}" | grep -i -E -o -m1 "(D compiler)(.*)([0-9]+\.[0-9]+\.[0-9]+)")"
last_command_failed=$?

if [[ ${last_command_failed} != 0 ]]; then
  print_error "Failed to find a string line supplied by \`${DC}\` which contains the D compiler's version."
  exit 3
fi

DC_VERSION="$(echo "${dc_version_line_str}" | grep -i -E -o "[0-9]+\.[0-9]+\.[0-9]+")"
last_command_failed=$?

if [[ ${last_command_failed} != 0 ]]; then
  print_error "Failed to extract the D compiler's (\`${DC}\`) version from a string line previously found which was supposed to contain it."
  exit 4
else
  print_info "DC_VERSION=${DC_VERSION}"
fi

export DC_VERSION
