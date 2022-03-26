
# Notes

```bash
openssl req -new -config server.cnf -keyout server.key -out server.csr
openssl req -new -newkey rsa:2048 -nodes -keyout server.key -out server.csr -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"

openssl rsa -check -in server-dev.key
openssl req -text -noout -verify -in server-dev.csr
openssl x509 -text -noout -in server-dev.pem

openssl s_client -showcerts -connect www.google.com:443
```

```bash
[ req ]
prompt             = no
encrypt_key        = no
default_days       = 365
default_bits       = 2048
default_md         = sha512
req_extensions     = req_ext
distinguished_name = req_distinguished_name

[ req_distinguished_name ]
countryName         = US
localityName        = Atlanta
stateOrProvinceName = Georgia
organizationName    = ACME Inc.
commonName          = dev.ops.acme.com

[ req_ext ]
subjectAltName = @alt_names

[alt_names]
DNS.1  = dev.ops.gpp.cloud
```

# References

https://myonlineusb.wordpress.com/2011/06/19/what-are-the-differences-between-pem-der-p7bpkcs7-pfxpkcs12-certificates/
