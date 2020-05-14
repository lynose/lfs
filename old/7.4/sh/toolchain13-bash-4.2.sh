#!/bin/bash
if test -d $LFS/sources/bash-4.2
 then
  rm -rf $LFS/sources/bash-4.2
fi
tar -xzf $LFS/sources/bash-4.2.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/bash-4.2 &&

patch -Np1 -i ../bash-4.2-fixes-12.patch &&

./configure --prefix=/tools --without-bash-malloc &&
make &&
make test &&
make install &&
ln -vs bash /tools/bin/sh