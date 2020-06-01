#!/usr/bin/env bash

# Ensure that the script is run via the barrel script
if [[ "$(basename -- "$0")" != "00-all_deploy_scripts.sh" ]]; then
    echo "This script should not be run directly. Run the barrel script instead" >&2
    exit 1
fi

if [[ -z "$RENEWED_DOMAIN" ]]; then
  RENEWED_DOMAIN=$(echo "$RENEWED_DOMAINS" | awk '{print $NF}')
fi

scp -q "$HAPROXY_CERT_PATH/$RENEWED_DOMAIN.pem" "$HAPROXY_REMOTE_USER"@"$HAPROXY_REMOTE_IP":"$HAPROXY_REMOTE_CERT_PATH"/"$RENEWED_DOMAIN".pem
