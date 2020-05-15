#!/bin/bash
if test -d $LFS/sources/bash-5.0
 then
  rm -rf $LFS/sources/bash-5.0
fi

tar -xzf $LFS/sources/bash-5.0.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/bash-5.0 &&



./configure --prefix=/tools --without-bash-malloc &&
make &&
make tests &&
make install &&
ln -vs bash /tools/bin/sh
