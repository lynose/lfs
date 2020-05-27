#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/kbd-2.2.0
 then
  rm -rf /sources/kbd-2.2.0
fi

tar -xJf /sources/kbd-2.2.0.tar.xz -C /sources/ &&

cd /sources/kbd-2.2.0 &&

patch -Np1 -i ../kbd-2.2.0-backspace-1.patch &&
sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure &&
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in &&
PKG_CONFIG_PATH=/tools/lib/pkgconfig ./configure --prefix=/usr --disable-vlock &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check &&
${log} `basename "$0"` " checked" target &&

make install &&
mkdir -v       /usr/share/doc/kbd-2.2.0 &&
cp -R -v docs/doc/* /usr/share/doc/kbd-2.2.0 &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
