#!/bin/bash
if test -d /sources/xz-5.2.5
 then
  rm -rf /sources/xz-5.2.5
fi
tar -xJf /sources/xz-5.2.5.tar.xz -C /sources/ &&

cd /sources/xz-5.2.5 &&

./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.5 &&
make &&
make check &&
make install &&
mv -v   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin &&
mv -v /usr/lib/liblzma.so.* /lib &&
ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so
