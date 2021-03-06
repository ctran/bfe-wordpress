#!/usr/bin/env bash

set -o errexit

BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

OPENSSL_SUBJ="/C=US/ST=California/L=San Diego"
OPENSSL_CA="${OPENSSL_SUBJ}/CN=CA"
OPENSSL_SERVER="${OPENSSL_SUBJ}/CN=loclahost"
OPENSSL_CLIENT="${OPENSSL_SUBJ}/CN=$HOSTNAME"

DEST_DIR="$BIN_DIR/../certs"

pushd $DEST_DIR

# Generate new CA certificate ca.pem file.
openssl genrsa 2048 > ca-key.pem

openssl req -new -x509 -nodes -days 3600 \
    -subj "${OPENSSL_CA}" \
    -key ca-key.pem -out ca.pem

# Create the server-side certificates
# This has more interaction that must be automated
openssl req -newkey rsa:2048 -days 3600 -nodes \
    -subj "${OPENSSL_SERVER}" \
    -keyout server-key.pem -out server-req.pem
openssl rsa -in server-key.pem -out server-key.pem
openssl x509 -req -in server-req.pem -days 3600 \
    -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem


# Create the client-side certificates
openssl req -newkey rsa:2048 -days 3600 -nodes \
    -subj "${OPENSSL_CLIENT}" \
    -keyout client-key.pem -out client-req.pem
openssl rsa -in client-key.pem -out client-key.pem
openssl x509 -req -in client-req.pem -days 3600 \
    -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out client-cert.pem

# Verify the certificates are correct
openssl verify -CAfile ca.pem server-cert.pem client-cert.pem

rm -f server-req.pem
rm -f client-req.pem

popd
