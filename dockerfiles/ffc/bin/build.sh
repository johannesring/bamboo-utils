#!/bin/bash

packages="fiat instant dijitso ufl ffc"
for p in $packages; do
    fenics-build ${p}
done

# Build google test for testing uflacs
cd ${HOME}/build/src/ffc/libs/gtest-1.7.0 && \
    mkdir -p lib && \
    cd lib && \
    cmake .. && \
    make
