#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

_get_process_status() {
  local process_name=$1

  if [[ $(ps -ef | grep -c mbsync)  -ne 1 ]]; then
    echo "${process_name}"
  fi
}

print_process_indicators() {
  local process_indicators="`process_indicator_list_helper`"
  local last_process_indicator=""

  for process_indicator in $process_indicators; do
    if [ ! -z $last_process_indicator ]; then
      printf "$(_get_process_status "$last_process_indicator") | "
    fi

    last_process_indicator=$process_indicator
  done

  # Process last process_indicator and don't include separator
  if [ ! -z $last_process_indicator ]; then
    printf "$(_get_process_status "$last_process_indicator")"
  fi
}

print_process_indicators
