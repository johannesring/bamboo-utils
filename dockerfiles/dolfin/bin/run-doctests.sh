#!/bin/bash

set -e

cd ${FENICS_HOME}/src/dolfin/build
make run_doctest
