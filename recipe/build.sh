#!/bin/sh

set -e -o pipefail

./configure --prefix=${PREFIX} --disable-debug --disable-dependency-tracking

make
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
  make check
fi
make install
