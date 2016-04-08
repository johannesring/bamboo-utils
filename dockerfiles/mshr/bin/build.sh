#!/bin/bash

: ${FENICS_BUILD_TYPE=Developer}
: ${CMAKE_EXTRA_ARGS="-DENABLE_TESTS:BOOL=ON"}
: ${VERBOSE=1}
: ${PROCS=1}

packages="fiat ufl instant dijitso ffc dolfin"
for p in $packages; do
    fenics-build ${p}
done

# Build mshr with FENICS_BUILD_TYPE=Debug
export FENICS_BUILD_TYPE=Debug
fenics-build mshr
