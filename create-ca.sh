#!/bin/bash

# create-ca - Quickly create new CA for local dev server

# Environment variables, set local directory for certs
CERTSDIR=~/.certs/

# Name of the root CA file which will generate subsequent site certs
CAFILE=$1

function generate_ca()
{
    /usr/bin/openssl genrsa -out $CERTSDIR$CAFILE.key 2048
    /usr/bin/openssl req -x509 -new -nodes -key $CERTSDIR$CAFILE.key -sha256 -days 1024 -out $CERTSDIR$CAFILE.pem
}

if [ -z CAFILE ]; then
    echo "Provide file name for CA"
    exit
fi

if [ ! -d $CERTSDIR ]; then
    mkdir ~/.certs
fi

generate_ca