#!/bin/bash
if test -d $LFS/sources/Python-3.8.2
 then
  rm -rf $LFS/sources/Python-3.8.2
fi
tar -xJf $LFS/sources/Python-3.8.2.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/Python-3.8.2 &&


sed -i '/def add_multiarch_paths/a \        return' setup.py &&
./configure --prefix=/tools --without-ensurepip &&
make &&
make install
