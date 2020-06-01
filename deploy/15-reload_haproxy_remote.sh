#!/usr/bin/env bash


BASEDIR=$(dirname "$0")

source "$BASEDIR/.env"

ssh $HAPROXY_REMOTE_USER@$HAPROXY_REMOTE_IP 'service haproxy reload'
