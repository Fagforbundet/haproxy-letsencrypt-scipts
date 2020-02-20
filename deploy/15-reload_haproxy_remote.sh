#!/bin/bash

source $(dirname $0)/.env

ssh $HAPROXY_REMOTE_USER@$HAPROXY_REMOTE_IP 'service haproxy reload'
