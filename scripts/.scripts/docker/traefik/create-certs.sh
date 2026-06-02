#!/bin/sh
mkdir -p certs

# 1. Generate a local CA key and certificate
openssl genrsa -out certs/ca.key 2048

openssl req -x509 -new -nodes \
  -key certs/ca.key \
  -days 1825 \
  -out certs/ca.crt \
  -subj "/CN=Docker Local CA"

# 2. Generate a key and CSR for your services
openssl genrsa -out certs/local.key 2048

openssl req -new \
  -key certs/local.key \
  -out certs/local.csr \
  -subj "/CN=docker.local"

# 3. Create a SAN extension file
cat > certs/san.ext << EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage=digitalSignature,keyEncipherment
extendedKeyUsage=serverAuth
subjectAltName=@alt_names

[alt_names]
DNS.1=docker.local
DNS.2=*.docker.local
EOF

# 4. Sign the certificate with your local CA
openssl x509 -req \
  -in certs/local.csr \
  -CA certs/ca.crt \
  -CAkey certs/ca.key \
  -CAcreateserial \
  -out certs/local.crt \
  -days 365 \
  -extfile certs/san.ext

echo "Done. Now trust certs/ca.crt in your OS/browser."
