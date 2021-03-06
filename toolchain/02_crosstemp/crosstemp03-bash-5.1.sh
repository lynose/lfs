#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&
if [ -d $LFS/sources/bash-5.1 ]
 then
  rm -rf $LFS/sources/bash-5.1
fi

tar xf $LFS/sources/bash-5.1.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/bash-5.1 &&

./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
mv $LFS/usr/bin/bash $LFS/bin/bash &&
ln -sv bash $LFS/bin/sh &&
${log} `basename "$0"` " installed" crosstemp &&

rm -rf $LFS/sources/bash-5.1 &&
${log} `basename "$0"` " finished" crosstemp
