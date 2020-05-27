#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/texinfo-6.7
 then
  rm -rf /sources/texinfo-6.7
fi

tar -xJf /sources/texinfo-6.7.tar.xz -C /sources/ &&

cd /sources/texinfo-6.7 &&

./configure --prefix=/usr --disable-static &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check -j1 &&
${log} `basename "$0"` " unexpected check succeed" target
${log} `basename "$0"` " expected check fail" target

make install &&
make TEXMF=/usr/share/texmf install-tex &&
${log} `basename "$0"` " installed" target &&

pushd /usr/share/info
rm -v dir
for f in *
  do install-info $f dir 2>/dev/null
done
popd
${log} `basename "$0"` " finished" target 
