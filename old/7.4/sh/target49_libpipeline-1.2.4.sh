#!/bin/bash
if test -d /sources/libpipeline-1.2.4
 then
  rm -rf /sources/libpipeline-1.2.4
fi
tar -xzf /sources/libpipeline-1.2.4.tar.gz -C /sources/ &&

cd /sources/libpipeline-1.2.4 &&

PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr &&

make &&

make check &&

make install