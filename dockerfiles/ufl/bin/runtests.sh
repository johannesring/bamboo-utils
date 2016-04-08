#!/bin/bash

: ${WORKDIR=/data}

# Make sure WORKDIR is writable
sudo chmod -R a+w ${WORKDIR}

# Run tests and copy results to WORKDIR
cd ${HOME}/build/src/ufl
${PYTHON} -B -m pytest -svl --junitxml ${WORKDIR}/report.xml test
