#!/bin/bash

export BAMBOO_WORKDIR=${BAMBOO_WORKDIR:-"/data"}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${FENICS_HOME}/src/fiat/test/unit
${PYTHON} -B -m nose --verbose --with-xunit --xunit-file=${BAMBOO_WORKDIR}/report.xml
