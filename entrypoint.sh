#!/bin/bash

# Maintainer Egidio Docile <egdoc.dev@gmail.com>
#
# This script is used as the entrypoint of the container. It simply creates
# a self-signed certificate and a key if they don't already exist in the
# /cert directory where a VOLUME is mounted, so they can be easily shared
# with other containers.

set -o errexit
set -o nounset

if [[ -e /certs/server.crt && -e /certs/server.key ]]; then
  echo "server.key and server.cert already exist, skipping..." >&2
else
  openssl \
    req \
    -newkey rsa:2048 \
    -nodes \
    -keyout /certs/server.key \
    -x509 \
    -days "${CERT_DAYS}" \
    -out /certs/server.crt \
    -subj "/C=${CERT_COUNTRY}/ST=${CERT_STATE}/L=${CERT_LOCALITY}/O=${CERT_ORGANIZATION_NAME}/CN=${CERT_COMMON_NAME}"
  chmod 755 /certs
fi
