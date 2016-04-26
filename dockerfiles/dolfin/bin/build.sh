#!/bin/bash

export FENICS_BUILD_TYPE=${FENICS_BUILD_TYPE:-"Developer"}
export CMAKE_EXTRA_ARGS=${CMAKE_EXTRA_ARGS:-"-DDOLFIN_ENABLE_TESTING:BOOL=ON"}
export VERBOSE=${VERBOSE:-1}
export PROCS=${PROCS:-1}

packages="fiat ufl instant dijitso ffc dolfin"
for p in $packages; do
    fenics-build ${p}
done

# Build C++ unit tests and demos
cd ${FENICS_HOME}/src/dolfin/build
make -j${PROCS} tests
make -j${PROCS} demo
