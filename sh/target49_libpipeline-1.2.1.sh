#!/bin/bash
if test -d /sources/libpipeline-1.2.1
 then
  rm -rf /sources/libpipeline-1.2.1
fi
tar -xzf /sources/libpipeline-1.2.1.tar.gz -C /sources/ &&
cd /sources/libpipeline-1.2.1 &&
sed -i -e '/gets is a/d' gnulib/lib/stdio.in.h &&
PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr &&
make &&
make check &&
make install
