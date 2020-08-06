#!/usr/bin/env sh

##
## Input parameters
##
BINARY=/hashgardd/${BINARY:-hashgardd}
ID=${ID:-0}
LOG=${LOG:-hashgardd.log}

##
## Assert linux binary
##
if ! [ -f "${BINARY}" ]; then
	echo "The binary $(basename "${BINARY}") cannot be found. Please add the binary to the shared folder. Please use the BINARY environment variable if the name of the binary is not 'hashgardd' E.g.: -e BINARY=hashgardd_my_test_version"
	exit 1
fi
BINARY_CHECK="$(file "$BINARY" | grep 'ELF 64-bit LSB executable, x86-64')"
if [ -z "${BINARY_CHECK}" ]; then
	echo "Binary needs to be OS linux, ARCH amd64"
	exit 1
fi

##
## Run binary with all parameters
##
export HASHGARDDHOME="/hashgardd/node${ID}/hashgardd"

if [ -d "`dirname ${HASHGARDDHOME}/${LOG}`" ]; then
  "$BINARY" --home "$HASHGARDDHOME" "$@" | tee "${HASHGARDDHOME}/${LOG}"
else
  "$BINARY" --home "$HASHGARDDHOME" "$@"
fi

chmod 777 -R /hashgardd

