#!/bin/bash
if test -d /sources/kbd-1.15.5
 then
  rm -rf /sources/kbd-1.15.5
fi

tar -xzf /sources/kbd-1.15.5.tar.gz -C /sources/ &&

cd /sources/kbd-1.15.5 &&

patch -Np1 -i ../kbd-1.15.5-backspace-1.patch &&

sed -i -e '326 s/if/while/' src/loadkeys.analyze.l &&

sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure &&
sed -i 's/resizecons.8 //' man/man8/Makefile.in &&

./configure --prefix=/usr --disable-vlock &&

make &&

make install &&

mkdir -v       /usr/share/doc/kbd-1.15.5 &&
cp -R -v doc/* /usr/share/doc/kbd-1.15.5