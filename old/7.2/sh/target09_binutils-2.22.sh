#!/bin/bash
if test -d /sources/binutils-2.22
 then
  rm -rf /sources/binutils-2.22
fi
tar -xjf /sources/binutils-2.22.tar.bz2 -C /sources &&
cd /sources/binutils-2.22 &&
rm -fv etc/standards.info &&
sed -i.bak '/^INFO/s/standards.info //' etc/Makefile.in &&
patch -Np1 -i ../binutils-2.22-build_fix-1.patch &&

if test -d ../binutils-build
 then
  rm -rf ../binutils-build
fi
mkdir -v ../binutils-build &&
cd ../binutils-build &&
../binutils-2.22/configure --prefix=/usr --enable-shared &&
make tooldir=/usr &&
make -k check &&
make tooldir=/usr install &&
cp -v ../binutils-2.22/include/libiberty.h /usr/include