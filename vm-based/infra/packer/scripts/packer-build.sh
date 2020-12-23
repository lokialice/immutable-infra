#!/usr/bin/env bash

set -o errexit
set -o pipefail
function build_image() {
    export role_name=$1
    echo "ROLE_NAME: ${role_name}"
    #Inspect script
    packer \
    inspect \
      packer.json \
    ;

    #Validate packer script
    packer \
    validate \
      -var-file "variables.json" \
      packer.json \
    ;
    #Packaging image
    packer \
    build \
      -var-file "variables.json" \
      packer.json \
    ;
}

echo "ROLE NAME in script: $1"
build_image $1
