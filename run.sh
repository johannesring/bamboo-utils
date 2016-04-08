#!/bin/bash

if [[ $# -lt 2 ]]; then
    echo "usage: ${0##*/} PROJECT COMMAND"
    exit 1
fi
PROJECT=${1}
DOCKER_CMD=${2}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. ${SCRIPT_DIR}/bamboo.conf

# Make sure volumes for instant cache and ccache exists
docker volume create --name instant-cache-${DOCKER_IMAGE_BASENAME}
docker volume create --name ccache

docker pull ${DOCKER_REPO}

docker run \
       --volume ccache:/home/fenics/.ccache \
       --volume instant-cache-${DOCKER_IMAGE_BASENAME}:/home/fenics/.instant \
       --volume ${bamboo_working_directory}:${BAMBOO_WORKDIR} \
       --workdir /home/fenics \
       --rm \
       ${DOCKER_REPO} \
       ${DOCKER_CMD}
