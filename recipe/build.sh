#!/bin/sh
# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./build-aux

set -e -o pipefail

cp ${BUILD_PREFIX}/share/gnuconfig/config.* build-aux/
./configure --prefix=${PREFIX} --disable-debug --disable-dependency-tracking --disable-static
make

if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
  make check
fi

make install
