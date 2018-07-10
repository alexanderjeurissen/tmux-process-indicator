#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux_process_indicator="#($CURRENT_DIR/scripts/tmux_process_indicator.sh)"
tmux_process_indicator_interpolation_string="\#{process_indicators}"

source $CURRENT_DIR/scripts/helpers.sh

do_interpolation() {
  local string="$1"
  local interpolated="${string/$tmux_process_indicator_interpolation_string/$tmux_process_indicator}"
  echo "$interpolated"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}
main
