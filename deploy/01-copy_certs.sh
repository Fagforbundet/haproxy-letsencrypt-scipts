#!/bin/bash

set -e

source $(dirname $0)/.env

DOMAIN=$(echo $RENEWED_DOMAINS | awk '{print $NF}')
cat "$RENEWED_LINEAGE/fullchain.pem" "$RENEWED_LINEAGE/privkey.pem" > "$HAPROXY_CERT_PATH/$DOMAIN.pem"
