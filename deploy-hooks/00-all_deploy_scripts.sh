#!/usr/bin/env bash

set -e

BASEDIR_DEPLOY_SCRIPTS="$(dirname "$(readlink -f "$0")")"
BASEDIR="$BASEDIR_DEPLOY_SCRIPTS/.."

source "$BASEDIR/.env"

source "$BASEDIR_DEPLOY_SCRIPTS/01-copy_certs.sh"
source "$BASEDIR_DEPLOY_SCRIPTS/05-copy_certs_remote.sh"
source "$BASEDIR_DEPLOY_SCRIPTS/10-reload_haproxy.sh"
source "$BASEDIR_DEPLOY_SCRIPTS/15-reload_haproxy_remote.sh"
