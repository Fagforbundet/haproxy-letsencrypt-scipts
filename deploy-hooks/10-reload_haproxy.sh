#!/usr/bin/env bash

# Ensure that the script is run via the barrel script
if [[ "$(basename -- "$0")" != "00-all_deploy_scripts.sh" ]]; then
  echo "This script should not be run directly. Run the barrel script instead" >&2
  exit 1
fi

"$HAPROXY_RELOAD_COMMAND"
