#!/bin/bash

export BAMBOO_WORKDIR=${BAMBOO_WORKDIR:-"/data"}
export INSTANT_CACHE_DIR=${INSTANT_CACHE_DIR:-"${HOME}/.instant/cache"}
export INSTANT_ERROR_DIR=${INSTANT_ERROR_DIR:-"${HOME}/.instant/error"}
export FFC_USE_CTYPES=${FFC_USE_CTYPES:-1}
export DOLFIN_NOPLOT=${DOLFIN_NOPLOT:-1}
export PROCS=${PROCS:-1}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${FENICS_HOME}/src/mshr/build
ctest -j${PROCS} -T Test -E Python
cp -r Testing ${BAMBOO_WORKDIR}
