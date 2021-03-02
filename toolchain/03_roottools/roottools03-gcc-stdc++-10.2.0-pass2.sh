#!/bin/bash
${log} `basename "$0"` " started" roottools &&

if [ -d /sources/gcc-10.2.0 ]
 then
  rm -rf /sources/gcc-10.2.0
fi

tar xf /sources/gcc-10.2.0.tar.xz -C /sources/ &&

cd /sources/gcc-10.2.0 &&

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

rm -rf /sources/gcc-10.2.0 &&
${log} `basename "$0"` " finished" roottools
