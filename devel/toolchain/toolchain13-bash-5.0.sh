#!/bin/bash
${log} `basename "$0"` " started" toolchain &&
if test -d $LFS/sources/bash-5.0
 then
  rm -rf $LFS/sources/bash-5.0
fi

tar -xzf $LFS/sources/bash-5.0.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/bash-5.0 &&

./configure --prefix=/tools --without-bash-malloc &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make tests &&
${log} `basename "$0"` " tested" toolchain &&
make install &&
ln -vs bash /tools/bin/sh &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
