#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/binutils-2.36.1
 then
  rm -rf /sources/binutils-2.36.1
fi

tar -xJf /sources/binutils-2.36.1.tar.xz -C /sources &&

cd /sources/binutils-2.36.1 &&

expect -c "spawn ls" > /root/spawn.log &&

sed -i '/@\tincremental_copy/d' gold/testsuite/Makefile.in &&

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

if [ ${ENABLE_TEST} == true ]
 then
  #critical section
  make -k check &&
  ${log} `basename "$0"` " check succeed" blfs_all ||
  ${log} `basename "$0"` " critical check fail?" blfs_all
fi

make tooldir=/usr install &&
rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
