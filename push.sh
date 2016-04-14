#!/bin/bash

set -e

if [[ $# -lt 1 ]]; then
    echo "usage: ${0##*/} PROJECT"
    exit 1
fi
PROJECT=${1}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. ${SCRIPT_DIR}/bamboo.conf

docker login \
       --username ${bamboo_DOCKER_REGISTRY_USERNAME} \
       --email ${bamboo_DOCKER_REGISTRY_EMAIL} \
       --password ${bamboo_DOCKER_REGISTRY_PASSWORD} \
       ${bamboo_DOCKER_REGISTRY_SERVER}

docker push ${DOCKER_REPO}
