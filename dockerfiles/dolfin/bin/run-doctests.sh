#!/bin/bash

set -e

cd ${HOME}/build/src/dolfin/build
make run_doctest
