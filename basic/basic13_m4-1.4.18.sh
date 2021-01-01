#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/m4-1.4.18
 then
  rm -rf /sources/m4-1.4.18
fi

tar xf /sources/m4-1.4.18.tar.xz -C /sources/ &&

cd /sources/m4-1.4.18 &&

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c &&
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
