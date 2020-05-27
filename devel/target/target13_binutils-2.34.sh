#!/bin/bash
${log} `basename "$0"` " started" target &&

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
${log} `basename "$0"` " configured" target &&

make tooldir=/usr &&
${log} `basename "$0"` " built" target &&

make -k check &&
${log} `basename "$0"` " Unexpeced check succeeds" target

make tooldir=/usr install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
