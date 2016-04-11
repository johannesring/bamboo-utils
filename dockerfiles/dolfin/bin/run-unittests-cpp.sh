#!/bin/bash

export BAMBOO_WORKDIR=${BAMBOO_WORKDIR:-"/data"}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${HOME}/build/src/dolfin/build
./test/unit/cpp/unittests_cpp --gtest_output=xml:${BAMBOO_WORKDIR}/report.xml
