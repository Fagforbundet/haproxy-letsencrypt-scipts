#!/bin/bash

set -e
set -x

DIR=$(dirname $0)
source $DIR/.env

chmod +x $DIR/deploy/01-copy_certs.sh
chmod +x $DIR/deploy/05-copy_certs_remote.sh
chmod +x $DIR/deploy/10-reload_haproxy.sh
chmod +x $DIR/deploy/15-reload_haproxy_remote.sh

ln -s $(realpath $DIR)/deploy/01-copy_certs.sh $DEPLOY_HOOK_PATH/01-copy_certs.sh
ln -s $(realpath $DIR)/deploy/05-copy_certs_remote.sh $DEPLOY_HOOK_PATH/05-copy_certs_remote.sh
ln -s $(realpath $DIR)/deploy/10-reload_haproxy.sh $DEPLOY_HOOK_PATH/10-reload_haproxy.sh
ln -s $(realpath $DIR)/deploy/15-reload_haproxy_remote.sh $DEPLOY_HOOK_PATH/15-reload_haproxy_remote.sh

cp $DIR/deploy/.env.example $DEPLOY_HOOK_PATH/.env

nano -c $DEPLOY_HOOK_PATH/.env
