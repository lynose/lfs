#!/bin/bash
if test -d /sources/texinfo-4.13
 then
  rm -rf /sources/texinfo-4.13
fi
tar -xjf /sources/texinfo-4.13a.tar.bz2 -C /sources/ &&
cd /sources/texinfo-4.13 &&
./configure --prefix=/usr &&
make &&
make check &&
make install &&
make TEXMF=/usr/share/texmf install-tex &&
cd /usr/share/info &&
rm -v dir &&
for f in *
do install-info $f dir 2>/dev/null
done