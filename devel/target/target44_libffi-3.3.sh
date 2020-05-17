#!/bin/bash
if test -d /sources/libffi-3.3
 then
  rm -rf /sources/libffi-3.3
fi

tar -xzf /sources/libffi-3.3.tar.gz -C /sources/ &&

cd /sources/libffi-3.3 &&

./configure --prefix=/usr --disable-static --with-gcc-arch=native &&

make &&

make check 

make install

