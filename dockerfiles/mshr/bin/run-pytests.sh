#!/bin/bash

: ${BAMBOO_WORKDIR=/data}
: ${INSTANT_CACHE_DIR=${HOME}/.instant/cache}
: ${INSTANT_ERROR_DIR=${HOME}/.instant/error}
: ${FFC_USE_CTYPES=1}
: ${DOLFIN_NOPLOT=1}
: ${PROCS=1}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${HOME}/build/src/mshr/build
ctest -j${PROCS} -T Test -E Python
cp -r Testing ${BAMBOO_WORKDIR}
