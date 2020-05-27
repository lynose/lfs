#!/bin/bash
${log} `basename "$0"` " started" target &&

if test -d /sources/m4-1.4.18
 then
  rm -rf /sources/m4-1.4.18
fi

tar -xJf /sources/m4-1.4.18.tar.xz -C /sources/ &&

cd /sources/m4-1.4.18 &&

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c &&
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
