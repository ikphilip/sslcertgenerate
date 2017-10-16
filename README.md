# Quick SSL Generation

Use these script to quickly create a new Certificate Authority and generate individual site SSL certificates for use on MAMP or local development servers.

Inspired by [this site](https://datacenteroverlords.com/2012/03/01/creating-your-own-ssl-certificate-authority/) and my inability to remember these openssl instructions.

## Requires
- OpenSSL
- Ability to install CA root certificate in browser or OS (admin rights)

## Instruction
1. Set local environment variable `CERTSDIR` where all cert files will be held. By default will install in .cert directory in home folder.
1. Run ./create-ca.sh with a single parameter which is the name of the CA key and cert. E.g. `create-ca.sh rootCA`
1. Then generate site certs using ./create-cert.sh using first parameter to identify the root CA file names and the second as the name for the site certificate files. E.g. `create-cert.sh rootCA site.local`
1. To use install the CA root certificate as trusted in your browser or OS. Then enable SSL on the local development server using the generated certificates.

#### How-To Install Trusted CA Root Certificates
- [macOS](https://support.apple.com/kb/PH25443?locale=en_US&viewlocale=en_US)