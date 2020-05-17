#!/bin/bash
if test -d /sources/libpipeline-1.5.2
 then
  rm -rf /sources/libpipeline-1.5.2
fi
tar -xzf /sources/libpipeline-1.5.2.tar.gz -C /sources/ &&

cd /sources/libpipeline-1.5.2 &&

./configure --prefix=/usr &&

make &&

make check &&

make install
