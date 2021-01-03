#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/kbd-2.4.0
 then
  rm -rf /sources/kbd-2.4.0
fi

tar -xJf /sources/kbd-2.4.0.tar.xz -C /sources/ &&

cd /sources/kbd-2.4.0 &&

patch -Np1 -i ../kbd-2.4.0-backspace-1.patch &&
sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure &&
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in &&
./configure --prefix=/usr --disable-vlock &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

if [ ${ENABLE_TEST} == true ]
 then
    make check &&
    ${log} `basename "$0"` " checked" basic
fi

make install &&
mkdir -v       /usr/share/doc/kbd-2.4.0 &&
cp -R -v docs/doc/* /usr/share/doc/kbd-2.4.0 &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
