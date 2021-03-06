#!/usr/bin/env bash

set -e

BASEDIR=$(dirname "$0")
BASEDIR_DEPLOY_SCRIPTS="$BASEDIR/deploy-hooks"

source "$BASEDIR/.env"

usage() { echo "Usage: $(basename "$0") <domain name>" 1>&2; }

if [[ -z "$1" ]]; then
  usage
  exit 1;
else
  DOMAIN="$1"
fi


certbot revoke --config "$BASEDIR/certbot-config.ini" --cert-path "/etc/letsencrypt/live/$DOMAIN/cert.pem"
