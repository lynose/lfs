#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/kbd-2.3.0
 then
  rm -rf /sources/kbd-2.3.0
fi

tar -xJf /sources/kbd-2.3.0.tar.xz -C /sources/ &&

cd /sources/kbd-2.3.0 &&

patch -Np1 -i ../kbd-2.3.0-backspace-1.patch &&
sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure &&
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in &&
./configure --prefix=/usr --disable-vlock &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " checked" basic &&

make install &&
rm -v /usr/lib/libtswrap.{a,la,so*} &&
mkdir -v       /usr/share/doc/kbd-2.3.0 &&
cp -R -v docs/doc/* /usr/share/doc/kbd-2.3.0 &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
