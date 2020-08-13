#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/binutils-2.35
 then
  rm -rf /sources/binutils-2.35
fi

tar -xJf /sources/binutils-2.35.tar.xz -C /sources &&

cd /sources/binutils-2.35 &&

expect -c "spawn ls" > /root/spawn.log &&

sed -i '/@\tincremental_copy/d' gold/testsuite/Makefile.in &&

if test -d build
 then
  rm -rf build
fi
mkdir -v build &&
cd build &&

../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib &&
${log} `basename "$0"` " configured" basic &&

make tooldir=/usr &&
${log} `basename "$0"` " built" basic &&

make -k check &&
${log} `basename "$0"` " Unexpeced check succeeds" basic

make tooldir=/usr install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
