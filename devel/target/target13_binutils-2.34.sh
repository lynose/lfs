#!/bin/bash
if test -d /sources/binutils-2.34
 then
  rm -rf /sources/binutils-2.34
fi

tar -xJf /sources/binutils-2.34.tar.xz -C /sources &&

cd /sources/binutils-2.34 &&

expect -c "spawn ls" > /root/spawn.log &&

sed -i '/@\tincremental_copy/d' gold/testsuite/Makefile.in &&

if test -d ../binutils-build
 then
  rm -rf ../binutils-build
fi
mkdir -v ../binutils-build &&
cd ../binutils-build &&

../binutils-2.34/configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib &&

make tooldir=/usr &&

make -k check

make tooldir=/usr install

