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


certbot certonly --standalone -d "$DOMAIN" --non-interactive --agree-tos --email "$LETS_ENCRYPT_EMAIL" --server "$LETS_ENCRYPT_SERVER" --http-01-port=8888 --tls-sni-01-port=8889
