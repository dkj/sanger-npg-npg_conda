#!/bin/sh

set -ex

n="$CPU_COUNT"

git fetch --tags --all
git describe
git describe --tags
git describe --tags --always

autoheader
autoconf

./configure --prefix="$PREFIX" \
            --with-htslib=system \
            --without-curses \
            CPPFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib"
        
make -j "$n" AR="$AR"
make install prefix="$PREFIX"
