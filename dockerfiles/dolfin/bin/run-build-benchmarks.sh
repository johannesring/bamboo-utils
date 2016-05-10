#!/bin/bash

export VERBOSE=${VERBOSE:-1}
export PROCS=${PROCS:-1}

# Build benchmarks
cd ${FENICS_HOME}/src/dolfin/build
cmake -DDOLFIN_ENABLE_BENCHMARKS:BOOL=ON ..
make -j${PROCS} bench
