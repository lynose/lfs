#!/bin/bash
${log} `basename "$0"` " started" toolchain &&
if test -d $LFS/sources/tcl8.6.10
 then
  rm -rf $LFS/sources/tcl8.6.10
fi

tar -xzf $LFS/sources/tcl8.6.10-src.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/tcl8.6.10 &&

cd unix &&
./configure --prefix=/tools &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

TZ=UTC make test &&
${log} `basename "$0"` " tested" toolchain &&

make install &&
chmod -v u+w /tools/lib/libtcl8.6.so &&
make install-private-headers &&
ln -sv tclsh8.6 /tools/bin/tclsh &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain

