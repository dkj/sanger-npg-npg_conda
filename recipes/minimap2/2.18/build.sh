#!/bin/sh

set -ex

n="$CPU_COUNT"

export CPATH=${PREFIX}/include

make -j $n CC="$GCC" INCLUDES="-I$PREFIX/include" CFLAGS="-g -Wall -O2 -Wc++-compat -L$PREFIX/lib" minimap2 sdust

mkdir -p "$PREFIX/bin"
cp minimap2 sdust misc/paftools.js "$PREFIX/bin/"

mkdir -p "$PREFIX/share/man/man1"
cp minimap2.1 "$PREFIX/share/man/man1/"
