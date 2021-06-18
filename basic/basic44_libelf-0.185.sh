#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/elfutils-0.185
 then
  rm -rf /sources/elfutils-0.185
fi

tar xf /sources/elfutils-0.185.tar.bz2 -C /sources/ &&

cd /sources/elfutils-0.185 &&

./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy &&
            
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " check succeed" basic ||
${log} `basename "$0"` " !!!check fail!!!" basic

make -C libelf install &&
install -vm644 config/libelf.pc /usr/lib/pkgconfig &&
rm /usr/lib/libelf.a &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/elfutils-0.185 &&
${log} `basename "$0"` " finished" basic 


