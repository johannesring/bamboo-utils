#!/bin/bash

export BAMBOO_WORKDIR=${WORKDIR:-"/data"}

# Make sure WORKDIR is writable
sudo chmod -R a+w ${WORKDIR}

# Run tests and copy results to WORKDIR
cd ${FENICS_HOME}/src/ufl/test
${PYTHON} -B -m pytest -svl --junitxml ${WORKDIR}/report.xml .
