#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/elfutils-0.180
 then
  rm -rf /sources/elfutils-0.180
fi

tar xf /sources/elfutils-0.180.tar.bz2 -C /sources/ &&

cd /sources/elfutils-0.180 &&

./configure --prefix=/usr --disable-debuginfod --libdir=/lib &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " unexpected check succeed" basic
${log} `basename "$0"` " expected check fail?" basic

make -C libelf install &&
install -vm644 config/libelf.pc /usr/lib/pkgconfig &&
rm /lib/libelf.a &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 


