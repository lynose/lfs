#!/bin/bash
if test -d $LFS/sources/glibc-2.18
 then
  rm -rf $LFS/sources/glibc-2.18
fi
tar -xJf $LFS/sources/glibc-2.18.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/glibc-2.18 &&

if [ ! -r /usr/include/rpc/types.h ]; then 
  su -c 'mkdir -p /usr/include/rpc'
  su -c 'cp -v sunrpc/rpc/*.h /usr/include/rpc'
fi

sed -i -e 's/static __m128i/inline &/' sysdeps/x86_64/multiarch/strstr.c &&

if test -d ../glibc-build
 then
  rm -rf ../glibc-build
fi
mkdir -v ../glibc-build &&
cd ../glibc-build &&

../glibc-2.18/configure                             \
      --prefix=/tools                               \
      --host=$LFS_TGT                               \
      --build=$(../glibc-2.18/scripts/config.guess) \
      --disable-profile                             \
      --enable-kernel=2.6.32                        \
      --with-headers=/tools/include                 \
      libc_cv_forced_unwind=yes                     \
      libc_cv_ctors_header=yes                      \
      libc_cv_c_cleanup=yes &&
make &&
make install