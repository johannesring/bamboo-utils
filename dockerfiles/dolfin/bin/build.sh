#!/bin/bash

: ${FENICS_BUILD_TYPE=Developer}
: ${CMAKE_EXTRA_ARGS="-DDOLFIN_ENABLE_TESTING:BOOL=ON"}
: ${VERBOSE=1}
: ${PROCS=1}

packages="fiat ufl instant dijitso ffc dolfin"
for p in $packages; do
    fenics-build ${p}
done

# Build C++ unit tests and demos
cd ${HOME}/build/src/dolfin/build
make -j${PROCS} tests
make -j${PROCS} demo
