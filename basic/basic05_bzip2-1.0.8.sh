#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/bzip2-1.0.8
 then
  rm -rf /sources/bzip2-1.0.8
fi
tar xf /sources/bzip2-1.0.8.tar.gz -C /sources &&
cd /sources/bzip2-1.0.8 &&

patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch &&

sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile &&

sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile &&

make -f Makefile-libbz2_so &&
${log} `basename "$0"` " built dynamic" basic &&
make clean &&
${log} `basename "$0"` " cleaned" basic &&

make &&
${log} `basename "$0"` " built static" basic &&

make PREFIX=/usr install &&
cp -v bzip2-shared /bin/bzip2 &&
cp -av libbz2.so* /lib &&
ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so &&
rm -v /usr/bin/{bunzip2,bzcat,bzip2} &&
ln -sv bzip2 /bin/bunzip2 &&
ln -sv bzip2 /bin/bzcat &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/bzip2-1.0.8 &&
${log} `basename "$0"` " finished" basic 
