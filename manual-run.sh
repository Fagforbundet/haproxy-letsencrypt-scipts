#!/usr/bin/env bash

set -e

BASEDIR=$(dirname "$0")
BASEDIR_DEPLOY_SCRIPTS="$BASEDIR/deploy-hooks"

source "$BASEDIR/.env"

usage() { echo "Usage: $0 <domain name>" 1>&2; }

if [[ -z "$1" ]]; then
  usage
  exit 1;
else
  RENEWED_DOMAIN="$1"
fi

export RENEWED_LINEAGE="$CERT_FOLDER_PATH/$RENEWED_DOMAIN"

if [ ! -d "$RENEWED_LINEAGE" ]; then
  echo "The folder ${RENEWED_LINEAGE} does not seem to exist"
  exit 1
fi

"$BASEDIR_DEPLOY_SCRIPTS/00-all_deploy_scripts.sh"
