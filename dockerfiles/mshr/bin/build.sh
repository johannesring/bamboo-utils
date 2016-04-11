#!/bin/bash

export FENICS_BUILD_TYPE=${FENICS_BUILD_TYPE:-"Developer"}
export CMAKE_EXTRA_ARGS=${CMAKE_EXTRA_ARGS:-"-DENABLE_TESTS:BOOL=ON"}
export VERBOSE=${VERBOSE:-1}
export PROCS=${PROCS:-1}

packages="fiat ufl instant dijitso ffc dolfin"
for p in $packages; do
    fenics-build ${p}
done

# Build mshr with FENICS_BUILD_TYPE=Debug
export FENICS_BUILD_TYPE=Debug
fenics-build mshr
