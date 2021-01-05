#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/zstd-1.4.5
 then
  rm -rf /sources/zstd-1.4.5
fi

tar -xzf /sources/zstd-1.4.5.tar.gz -C /sources/ &&

cd /sources/zstd-1.4.5 &&

make &&
${log} `basename "$0"` " built" basic &&

make prefix=/usr install &&
rm -v /usr/lib/libzstd.a &&
mv -v /usr/lib/libzstd.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libzstd.so) /usr/lib/libzstd.so &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 