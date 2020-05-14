#!/bin/bash
if test -d /sources/texinfo-5.1
 then
  rm -rf /sources/texinfo-5.1
fi

tar -xJf /sources/texinfo-5.1.tar.xz -C /sources/ &&

cd /sources/texinfo-5.1 &&

patch -Np1 -i ../texinfo-5.1-test-1.patch &&

./configure --prefix=/usr &&

make &&

#make check

make install &&

make TEXMF=/usr/share/texmf install-tex &&

cd /usr/share/info &&
rm -v dir &&
for f in *
do install-info $f dir 2>/dev/null
done