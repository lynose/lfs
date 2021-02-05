#!/bin/bash
${log} `basename "$0"` " started" crosstools &&

if [ -d $LFS/sources/glibc-2.33 ]
 then
  rm -rf $LFS/sources/glibc-2.33
fi

tar xf $LFS/sources/glibc-2.33.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/glibc-2.33 &&

case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac

patch -Np1 -i ../glibc-2.33-fhs-1.patch &&

mkdir -v build &&
cd build &&

../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/lib &&

${log} `basename "$0"` " configured" crosstools &&

make &&
${log} `basename "$0"` " build" crosstools &&

make DESTDIR=$LFS install &&
$LFS/tools/libexec/gcc/$LFS_TGT/10.2.0/install-tools/mkheaders &&
${log} `basename "$0"` " installed" crosstools &&
${log} `basename "$0"` " finished" crosstools
