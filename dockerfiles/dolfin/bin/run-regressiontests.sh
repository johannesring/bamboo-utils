#!/bin/bash

export BAMBOO_WORKDIR=${BAMBOO_WORKDIR:-"/data"}
export INSTANT_CACHE_DIR=${INSTANT_CACHE_DIR:-"${HOME}/.instant/cache"}
export INSTANT_ERROR_DIR=${INSTANT_ERROR_DIR:-"${HOME}/.instant/error"}
export FFC_USE_CTYPES=${FFC_USE_CTYPES:-1}
export DOLFIN_NOPLOT=${DOLFIN_NOPLOT:-1}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${FENICS_HOME}/src/dolfin/build
make run_regressiontests
if [ "$?" -ne "0" ]; then
    cp test/regression/demo.log ${BAMBOO_WORKDIR}
    exit 1
else
    exit 0
fi
