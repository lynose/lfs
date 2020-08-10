#!/bin/bash
${log} `basename "$0"` " started" roottools &&

cd $LFS/sources/gcc-10.2.0 &&

if [ -d build ]
 then
  rm -rf build
fi

ln -s gthr-posix.h libgcc/gthr-default.h

mkdir -v build &&
cd build &&

../libstdc++-v3/configure            \
    CXXFLAGS="-g -O2 -D_GNU_SOURCE"  \
    --prefix=/usr                    \
    --disable-multilib               \
    --disable-nls                    \
    --host=$(uname -m)-lfs-linux-gnu \
    --disable-libstdcxx-pch &&
    
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

make install &&
${log} `basename "$0"` " installed" roottools &&
${log} `basename "$0"` " finished" roottools
