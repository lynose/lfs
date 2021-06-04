#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/texinfo-6.7
 then
  rm -rf /sources/texinfo-6.7
fi

tar xf /sources/texinfo-6.7.tar.xz -C /sources/ &&

cd /sources/texinfo-6.7 &&

./configure --prefix=/usr --disable-static &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " check succeed" basic ||
${log} `basename "$0"` " !!!check failed!!!" basic

make install &&
make TEXMF=/usr/share/texmf install-tex &&
${log} `basename "$0"` " installed" basic &&

pushd /usr/share/info
rm -v dir
for f in *
  do install-info $f dir 2>/dev/null
done
popd

rm -rf /sources/texinfo-6.7 &&
${log} `basename "$0"` " finished" basic 
