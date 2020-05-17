#!/bin/bash
if test -d /sources/texinfo-6.7
 then
  rm -rf /sources/texinfo-6.7
fi

tar -xJf /sources/texinfo-6.7.tar.xz -C /sources/ &&

cd /sources/texinfo-6.7 &&

./configure --prefix=/usr --disable-static &&

make &&

make check

make install &&

make TEXMF=/usr/share/texmf install-tex &&

pushd /usr/share/info
rm -v dir
for f in *
  do install-info $f dir 2>/dev/null
done
popd
