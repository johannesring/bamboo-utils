#!/bin/bash

packages="instant dijitso"
for p in $packages; do
    fenics-build ${p}
done
