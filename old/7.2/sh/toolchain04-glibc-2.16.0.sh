#!/bin/bash
if test -d $LFS/sources/glibc-2.16.0
 then
  rm -rf $LFS/sources/glibc-2.16.0
fi
tar -xJf $LFS/sources/glibc-2.16.0.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/glibc-2.16.0 &&

if [ ! -r /usr/include/rpc/types.h ]; then 
  su -c 'mkdir -p /usr/include/rpc'
  su -c 'cp -v sunrpc/rpc/*.h /usr/include/rpc'
fi

sed -i 's/ -lgcc_s//' Makeconfig &&

if test -d ../glibc-build
 then
  rm -rf ../glibc-build
fi
mkdir -v ../glibc-build &&
cd ../glibc-build &&

../glibc-2.16.0/configure                             \
      --prefix=/tools                                 \
      --host=$LFS_TGT                                 \
      --build=$(../glibc-2.16.0/scripts/config.guess) \
      --disable-profile                               \
      --enable-add-ons                                \
      --enable-kernel=2.6.25                          \
      --with-headers=/tools/include                   \
      libc_cv_forced_unwind=yes                       \
      libc_cv_ctors_header=yes                        \
      libc_cv_c_cleanup=yes &&
make &&
make install