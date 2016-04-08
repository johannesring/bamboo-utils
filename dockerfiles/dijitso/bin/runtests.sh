#!/bin/bash

: ${BAMBOO_WORKDIR=/data}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${HOME}/build/src/dijitso/test && \
    ./runtests.sh && \
    cp -r htmlcov ${BAMBOO_WORKDIR}/ && \
    cp report*.xml ${BAMBOO_WORKDIR}/
