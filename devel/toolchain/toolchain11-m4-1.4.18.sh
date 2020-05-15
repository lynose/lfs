#!/bin/bash
if test -d $LFS/sources/m4-1.4.18
 then
  rm -rf $LFS/sources/m4-1.4.18
fi

tar -xJf $LFS/sources/m4-1.4.18.tar.xz -C $LFS/sources/ &&

cd $LFS/sources/m4-1.4.18 &&

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c &&
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h &&

./configure --prefix=/tools &&
make &&
make check &&
make install
