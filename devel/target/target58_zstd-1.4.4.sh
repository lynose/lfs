#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/zstd-1.4.4
 then
  rm -rf /sources/zstd-1.4.4
fi

tar -xzf /sources/zstd-1.4.4.tar.gz -C /sources/ &&

cd /sources/zstd-1.4.4 &&

make &&
${log} `basename "$0"` " built" target &&

make prefix=/usr install &&
rm -v /usr/lib/libzstd.a &&
mv -v /usr/lib/libzstd.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libzstd.so) /usr/lib/libzstd.so &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
