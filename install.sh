#!/usr/bin/env bash

set -e
set -x

BASEDIR=$(realpath "$(dirname "$0")")
BASEDIR_DEPLOY_SCRIPTS="$BASEDIR/deploy-hooks"

# Force clean .env file
cp -f "$BASEDIR/.env.example" "$BASEDIR/.env"

# Open nano to edit clean .env file
nano -c "$BASEDIR/.env"

source "$BASEDIR/.env"

# Ensure all scripts are executable
chmod +x "$BASEDIR/get-certificate.sh"
chmod +x "$BASEDIR/manual-run.sh"
chmod +x "$BASEDIR/revoke-certificate.sh"
chmod +x "$BASEDIR_DEPLOY_SCRIPTS/00-all_deploy_scripts.sh"
chmod +x "$BASEDIR_DEPLOY_SCRIPTS/01-copy_certs.sh"
chmod +x "$BASEDIR_DEPLOY_SCRIPTS/05-copy_certs_remote.sh"
chmod +x "$BASEDIR_DEPLOY_SCRIPTS/10-reload_haproxy.sh"
chmod +x "$BASEDIR_DEPLOY_SCRIPTS/15-reload_haproxy_remote.sh"

# Removes broken links from the deploy hook path
find "$LETS_ENCRYPT_DEPLOY_HOOK_PATH" -xtype l -delete

# Symlinks the barrel script
ln -fs "$BASEDIR_DEPLOY_SCRIPTS/00-all_deploy_scripts.sh" "$LETS_ENCRYPT_DEPLOY_HOOK_PATH/00-all_deploy_scripts.sh"
