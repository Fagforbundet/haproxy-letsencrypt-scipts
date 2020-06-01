#!/usr/bin/env bash

set -e
set -x

BASEDIR=$(realpath "$(dirname "$0")")

source "$BASEDIR/.env"

chmod +x "$BASEDIR/deploy/00-all_deploy_scripts.sh"
chmod +x "$BASEDIR/deploy/01-copy_certs.sh"
chmod +x "$BASEDIR/deploy/05-copy_certs_remote.sh"
chmod +x "$BASEDIR/deploy/10-reload_haproxy.sh"
chmod +x "$BASEDIR/deploy/15-reload_haproxy_remote.sh"

rm -f "$DEPLOY_HOOK_PATH/00-all_deploy_scripts.sh"
ln -s "$BASEDIR/deploy/00-all_deploy_scripts.sh" "$DEPLOY_HOOK_PATH/00-all_deploy_scripts.sh"

cp -f "$BASEDIR/deploy/.env.example" "$DEPLOY_HOOK_PATH/.env"

nano -c "$DEPLOY_HOOK_PATH/.env"
