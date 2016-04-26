#!/bin/bash

export BAMBOO_WORKDIR=${BAMBOO_WORKDIR:-"/data"}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${FENICS_HOME}/src/ffc/test/uflacs/crosslanguage
${PYTHON} -B -m pytest -svl --junitxml ${BAMBOO_WORKDIR}/report.xml .
