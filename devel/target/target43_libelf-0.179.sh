#!/bin/bash
if test -d /sources/elfutils-0.179
 then
  rm -rf /sources/elfutils-0.179
fi

tar -xjf /sources/elfutils-0.179.tar.bz2 -C /sources/ &&

cd /sources/elfutils-0.179 &&

./configure --prefix=/usr --disable-debuginfod &&

make &&

make check 

make -C libelf install &&
install -vm644 config/libelf.pc /usr/lib/pkgconfig &&
rm /usr/lib/libelf.a


