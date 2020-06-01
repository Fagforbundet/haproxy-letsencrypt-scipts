#!/usr/bin/env bash

set -e

BASEDIR=$(dirname "$0")

source "$BASEDIR/.env"

DOMAIN=$(echo $RENEWED_DOMAINS | awk '{print $NF}')

scp -q "$HAPROXY_CERT_PATH/$DOMAIN.pem" $HAPROXY_REMOTE_USER@$HAPROXY_REMOTE_IP:$HAPROXY_REMOTE_CERT_PATH/$DOMAIN.pem
