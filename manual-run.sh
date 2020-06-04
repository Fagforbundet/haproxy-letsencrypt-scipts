#!/usr/bin/env bash

set -e

BASEDIR=$(dirname "$0")
BASEDIR_DEPLOY_SCRIPTS="$BASEDIR/deploy-hooks"

source "$BASEDIR/.env"

usage() { echo "Usage: $(basename "$0") [<domain name>] [-a] [-h]" 1>&2; }

help() {
  usage
  printf "\n\nOptions:\n" 1>&2;
  printf "\n  -a      All. Runs manually for all folder names in the '%s' folder. Cannot be used together with a domain name." "$LETS_ENCRYPT_CERT_FOLDER_PATH" 1>&2;
  printf "\n  -h      Shows this help message" 1>&2;
  printf "\n\n\n" 1>&2;
}

while getopts "ah" opt; do
  case ${opt} in
    a )
      ALL="true"
      ;;
    h )
      help
      exit 0
      ;;
    * )
      ;;
  esac
done
shift $((OPTIND -1))

# Exit if no domain, and -a is not present
if [[ -z "$1" && -z "$ALL" ]]; then
  usage
  exit 1;
fi

# Exit if both domain and -a is present
if [[ -n "$1" && -n "$ALL" ]]; then
  usage
  exit 1;
fi

# Collect domains into array
if [[ -z "$1" ]]; then
  # shellcheck disable=SC2207
  # shellcheck disable=SC2190
  RENEWED_DOMAINS=($(find "$LETS_ENCRYPT_CERT_FOLDER_PATH" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort -t '\0' -n))
  for d in "${RENEWED_DOMAINS[@]}"; do
    printf "%s\n" "$d"
  done

  printf "\n"

  while true; do
    read -rp "Attempt to run manually for these ${#RENEWED_DOMAINS[@]} domains? [Yy/Nn]" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit 0;;
        * ) echo "You need to choose";;
    esac
done
else
  RENEWED_DOMAINS=([0]="$1")
fi

# Iterate over array of domains
for d in "${RENEWED_DOMAINS[@]}"; do
  export RENEWED_DOMAIN="$d"
  export RENEWED_LINEAGE="$LETS_ENCRYPT_CERT_FOLDER_PATH/$RENEWED_DOMAIN"

  if [[ ! -d "$RENEWED_LINEAGE" ]]; then
    echo "The folder ${RENEWED_LINEAGE} does not seem to exist"
    exit 1
  fi

  "$BASEDIR_DEPLOY_SCRIPTS/00-all_deploy_scripts.sh"
done
