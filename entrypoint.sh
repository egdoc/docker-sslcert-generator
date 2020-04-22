#!/bin/bash

# Maintainer Egidio Docile <egdoc.dev@gmail.com>
#
# This script is used as the entrypoint of the container. It simply creates
# a self-signed certificate and a key if they don't already exist in the
# /cert directory where a VOLUME is mounted, so they can be easily shared
# with other containers.

set -o errexit
set -o nounset

if [[ -e /certs/server.key && -e /certs/server.key ]]; then
  echo "server.key and server.cert already exist, skipping..." >&2
else
  openssl \
    req \
    -newkey rsa:2048 \
    -nodes \
    -keyout /certs/server.key \
    -x509 \
    -days "${DAYS}" \
    -out /certs/server.crt \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORGANIZATION_NAME}/CN=${COMMON_NAME}"
  chmod 755 /certs
fi
