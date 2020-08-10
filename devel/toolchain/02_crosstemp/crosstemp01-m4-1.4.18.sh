#!/bin/bash
${log} `basename "$0"` " started" crosstemp &&

if  [ -d $LFS/sources/m4-1.4.18 ]
 then
  rm -rf $LFS/sources/m4-1.4.18
fi

tar xf $LFS/sources/m4-1.4.18.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/m4-1.4.18 &&

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c &&
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h &&

./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess) &&
${log} `basename "$0"` " configured" crosstemp &&

make &&
${log} `basename "$0"` " build" crosstemp &&

make DESTDIR=$LFS install &&
${log} `basename "$0"` " installed" crosstemp &&
if  [ -d $LFS/sources/m4-1.4.18 ]
 then
  rm -rf $LFS/sources/m4-1.4.18
fi
${log} `basename "$0"` " finished" crosstemp
