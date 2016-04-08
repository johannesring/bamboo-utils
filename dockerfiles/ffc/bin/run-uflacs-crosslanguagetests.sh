#!/bin/bash

: ${BAMBOO_WORKDIR=/data}

# Make sure BAMBOO_WORKDIR is writable
sudo chmod -R a+w ${BAMBOO_WORKDIR}

# Run tests and copy results to BAMBOO_WORKDIR
cd ${HOME}/build/src/ffc/test/uflacs/crosslanguage
${PYTHON} -B -m pytest -svl --junitxml ${BAMBOO_WORKDIR}/report.xml .
