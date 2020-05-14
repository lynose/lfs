#!/bin/bash
RUN_DIR=$PWD &&
export RUN_DIR &&
echo $RUN_DIR &&

PACKAGES=$RUN_DIR/../packages &&
export PACKAGES &&
echo $PACKAGES &&

PATCHES=$RUN_DIR/../patch &&
export PATCHES &&
echo $PATCHES


SOURCES=$LFS/sources &&
export SOURCES &&
echo $SOURCES &&

GLIBC_VERSION=2.13 &&
export GLIBC_VERSION &&
echo $GLIBC_VERSION &&

echo $LFS_TGT &&

sleep 10 &&

if test -d $SOURCES/glibc-$GLIBC_VERSION
 then
  rm -rf $SOURCES/glibc-$GLIBC_VERSION
fi
tar xjf $PACKAGES/glibc-$GLIBC_VERSION.tar.bz2 -C $SOURCES &&

if test -d $SOURCES/glibc-build
 then
  rm -rf $SOURCES/glibc-build
fi
mkdir -v $SOURCES/glibc-build &&

cd  $SOURCES/glibc-$GLIBC_VERSION &&
patch -Np1 -i $PATCHES/glibc-$GLIBC_VERSION-gcc_fix-1.patch &&

cd $SOURCES/glibc-build &&

case `uname -m` in
  i?86) echo "CFLAGS += -march=i486 -mtune=native" > configparms ;;
esac

../glibc-$GLIBC_VERSION/configure --prefix=/tools \
    --host=$LFS_TGT --build=$(../glibc-$GLIBC_VERSION/scripts/config.guess) \
    --disable-profile --enable-add-ons \
    --enable-kernel=2.6.22.5 --with-headers=/tools/include \
    libc_cv_forced_unwind=yes libc_cv_c_cleanup=yes &&
make &&
make install
