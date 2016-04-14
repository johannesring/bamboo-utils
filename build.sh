#!/bin/bash

set -e

if [[ $# -lt 1 ]]; then
    echo "usage: ${0##*/} PROJECT"
    exit 1
fi
PROJECT=${1}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

. ${SCRIPT_DIR}/bamboo.conf

# Make sure we have the latest bamboo-base image
docker build \
       --pull \
       --file=${SCRIPT_DIR}/dockerfiles/bamboo-base/Dockerfile \
       --tag=bamboo-base ${SCRIPT_DIR}/dockerfiles/bamboo-base

# Generate build image
cd ${bamboo_working_directory}
cp -rf ${SCRIPT_DIR}/dockerfiles/${PROJECT}/* .
docker build \
       --file=Dockerfile \
       --tag=${DOCKER_IMAGE}-builder:tmp .

IS_EXISTING=$(docker ps -qa --filter name=${DOCKER_IMAGE}-builder 2>/dev/null)
if [[ -n ${IS_EXISTING} ]]; then
    docker rm --force ${DOCKER_IMAGE}-builder
fi

# Make sure volumes for instant cache and ccache exists
docker volume create --name instant-cache-${DOCKER_IMAGE_BASENAME}
docker volume create --name ccache

docker run \
       --name ${DOCKER_IMAGE}-builder \
       --volume ccache:/home/fenics/.ccache \
       --volume ${bamboo_working_directory}:${BAMBOO_WORKDIR} \
       --workdir /home/fenics \
       ${DOCKER_IMAGE}-builder:tmp \
       build.sh

docker commit \
       --author "FEniCS Bamboo" \
       --message "Generated by ${bamboo_buildResultsUrl}" \
       --change 'CMD ["/bin/bash", "-i"]' \
       ${DOCKER_IMAGE}-builder ${DOCKER_REPO}

docker rm ${DOCKER_IMAGE}-builder
