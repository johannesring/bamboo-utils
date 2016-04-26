#!/bin/bash

export BAMBOO_WORKDIR=${BAMBOO_WORKDIR:-"/data"}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${FENICS_HOME}/src/dijitso/test && \
    ./runtests.sh && \
    cp -r htmlcov ${BAMBOO_WORKDIR}/ && \
    cp report*.xml ${BAMBOO_WORKDIR}/
