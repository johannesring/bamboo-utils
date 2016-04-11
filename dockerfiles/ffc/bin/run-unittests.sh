#!/bin/bash

set -e

export BAMBOO_WORKDIR=${BAMBOO_WORKDIR:-"/data"}
export INSTANT_CACHE_DIR=${INSTANT_CACHE_DIR:-"${HOME}/.instant/cache"}
export INSTANT_ERROR_DIR=${INSTANT_ERROR_DIR:-"${HOME}/.instant/error"}
export FFC_USE_CTYPES=${FFC_USE_CTYPES:-1}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${HOME}/build/src/ffc/test/unit
${PYTHON} test.py
