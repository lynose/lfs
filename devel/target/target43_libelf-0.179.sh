#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/elfutils-0.179
 then
  rm -rf /sources/elfutils-0.179
fi

tar -xjf /sources/elfutils-0.179.tar.bz2 -C /sources/ &&

cd /sources/elfutils-0.179 &&

./configure --prefix=/usr --disable-debuginfod &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " unexpected check succeed" target
${log} `basename "$0"` " expected check fail?" target

make -C libelf install &&
install -vm644 config/libelf.pc /usr/lib/pkgconfig &&
rm /usr/lib/libelf.a &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 


