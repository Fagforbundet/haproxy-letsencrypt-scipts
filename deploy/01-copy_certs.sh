#!/usr/bin/env bash

set -e

BASEDIR=$(dirname "$0")

source "$BASEDIR/.env"

DOMAIN=$(echo "$RENEWED_DOMAINS" | awk '{print $NF}')
cat "$RENEWED_LINEAGE/fullchain.pem" "$RENEWED_LINEAGE/privkey.pem" > "$HAPROXY_CERT_PATH/$DOMAIN.pem"
