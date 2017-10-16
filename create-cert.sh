#!/bin/bash

# create-cert - Quickly create new cert for local dev server

# Environment variables, set locally and set the CA key and SSL certificate
CERTSDIR=~/.certs/

# Pass the new site name
CANAME=$1
SITENAME=$2
CAPRIV=$CERTSDIR$CANAME.pem
CAKEY=$CERTSDIR$CANAME.key

generate_cert()
{
# Generate a 5000 day cert using local CA
/usr/bin/openssl genrsa -out $CERTSDIR$SITENAME.key 2048
/usr/bin/openssl req -new -key $CERTSDIR$SITENAME.key -out $CERTSDIR$SITENAME.csr
/usr/bin/openssl x509 -req -in $CERTSDIR$SITENAME.csr -CA $CAPRIV -CAkey $CAKEY -CAcreateserial -out $CERTSDIR$SITENAME.crt -days 5000 -sha256
}

if [ -z $CANAME ]; then
    echo "Identify the name of the root CA files as first parameter"
    exit
fi

if [ -z $SITENAME ]; then
    echo "Provide site name for naming key as second parameter"
    exit
fi

if [ ! -d $CERTSDIR ]; then
    mkdir ~/.certs
fi

generate_cert