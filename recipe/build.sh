#!/usr/bin/env bash

mkdir build-stage
cd build-stage

cmake -LAH                                         \
      -DCMAKE_RULE_MESSAGES=ON                     \
      -DCMAKE_VERBOSE_MAKEFILE=OFF                 \
      -DCMAKE_BUILD_TYPE="Release"                 \
      -DCMAKE_INSTALL_PREFIX=${PREFIX}             \
      -DBUILD_SHARED_LIBS=ON                       \
      -DENABLE_DOCS=OFF                            \
      -DENABLE_EXAMPLES=ON                         \
      -DENABLE_TESTS=OFF                           \
      ..

make -j${CPU_COUNT}

# beware, tests are expensive (data downloads & many of them, some fairly slow)
# to enable: set cmake above, uncomment python in meta.yaml, uncomment below
# make -j${CPU_COUNT} runtests

make install
