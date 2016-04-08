#!/bin/bash

: ${BAMBOO_WORKDIR=/data}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${HOME}/build/src/fiat/test/regression
./scripts/download
${PYTHON} -B -m nose --verbose --with-xunit --xunit-file=${BAMBOO_WORKDIR}/report.xml
