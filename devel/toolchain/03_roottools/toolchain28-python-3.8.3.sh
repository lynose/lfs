#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/Python-3.8.3
 then
  rm -rf $LFS/sources/Python-3.8.3
fi
tar -xJf $LFS/sources/Python-3.8.3.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/Python-3.8.3 &&


sed -i '/def add_multiarch_paths/a \        return' setup.py &&
./configure --prefix=/tools --without-ensurepip &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
