#!/bin/bash
if test -d /sources/binutils-2.23.2
 then
  rm -rf /sources/binutils-2.23.2
fi
tar -xjf /sources/binutils-2.23.2.tar.bz2 -C /sources &&
cd /sources/binutils-2.23.2 &&

rm -fv etc/standards.info &&
sed -i.bak '/^INFO/s/standards.info //' etc/Makefile.in &&

sed -i -e 's/@colophon/@@colophon/' \
       -e 's/doc@cygnus.com/doc@@cygnus.com/' bfd/doc/bfd.texinfo &&

if test -d ../binutils-build
 then
  rm -rf ../binutils-build
fi
mkdir -v ../binutils-build &&
cd ../binutils-build &&

../binutils-2.23.2/configure --prefix=/usr --enable-shared &&

make tooldir=/usr &&

make check &&

make tooldir=/usr install &&

cp -v ../binutils-2.23.2/include/libiberty.h /usr/include