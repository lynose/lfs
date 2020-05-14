#!/bin/bash
if test -d $LFS/sources/bash-4.2
 then
  rm -rf $LFS/sources/bash-4.2
fi
tar -xjf $LFS/sources/bash-4.2.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/bash-4.2 &&

patch -Np1 -i ../bash-4.2-fixes-8.patch &&

./configure --prefix=/tools --without-bash-malloc &&
make tests &&
make &&
make install &&
ln -vs bash /tools/bin/sh