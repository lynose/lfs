#!/bin/bash
if test -d $LFS/sources/Python-3.8.3
 then
  rm -rf $LFS/sources/Python-3.8.3
fi
tar -xJf $LFS/sources/Python-3.8.3.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/Python-3.8.3 &&


sed -i '/def add_multiarch_paths/a \        return' setup.py &&
./configure --prefix=/tools --without-ensurepip &&
make &&
make install
