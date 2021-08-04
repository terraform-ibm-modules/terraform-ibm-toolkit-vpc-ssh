#!/usr/bin/env bash

PROVIDED_PUBLIC_KEY=$(cat terraform.tfvars | grep "public_key=" | sed 's/public_key="(.*)"/\1/g')
PROVIDED_PRIVATE_KEY=$(cat terraform.tfvars | grep "private_key=" | sed 's/private_key="(.*)"/\1/g')
PUBLIC_KEY=$(cat .public-key)
PRIVATE_KEY=$(cat .private-key)

echo "Provided public key: ${PROVIDED_PUBLIC_KEY}"
echo "Provided private key: ${PROVIDED_PRIVATE_KEY}"

if [[ -z "${PROVIDED_PUBLIC_KEY}" ]] && [[ -z "${PRIVATE_KEY}" ]] || [[ -z "${PUBLIC_KEY}" ]]; then
  echo "No public key provided. Should generate public and private key"
  exit 1
elif [[ -n "${PROVIDED_PUBLIC_KEY}" ]] && [[ "${PROVIDED_PRIVATE_KEY}" != "${PRIVATE_KEY}" ]]; then
  echo "Public key provided. Output private key should match input private key: ${PROVIDED_PRIVATE_KEY} != ${PRIVATE_KEY}"
  exit 1
fi
