#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/zstd-1.4.8
 then
  rm -rf /sources/zstd-1.4.8
fi

tar -xzf /sources/zstd-1.4.8.tar.gz -C /sources/ &&

cd /sources/zstd-1.4.8 &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " test succeed" basic || 
${log} `basename "$0"` " !!!test fail!!!" basic


make prefix=/usr install &&
rm -v /usr/lib/libzstd.a &&
mv -v /usr/lib/libzstd.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libzstd.so) /usr/lib/libzstd.so &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
