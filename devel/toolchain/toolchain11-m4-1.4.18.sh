#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/m4-1.4.18
 then
  rm -rf $LFS/sources/m4-1.4.18
fi

tar -xJf $LFS/sources/m4-1.4.18.tar.xz -C $LFS/sources/ &&

cd $LFS/sources/m4-1.4.18 &&

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c &&
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h &&

./configure --prefix=/tools &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

make check &&
${log} `basename "$0"` " checked" toolchain &&
make install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
