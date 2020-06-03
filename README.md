# haproxy-letsencrypt-scripts
This package expects a single domain per certificate.

## Install
```shell script
chmod +x install.sh
./install.sh
```

## Manual run
```shell script
./manual-run.sh [<domain name>] [-a] [-h]
```

## Get certificate
```shell script
./get-certificate.sh <domain name>
```

## Revoke certificate
```shell script
./revoke-certificate.sh <domain name>
```
