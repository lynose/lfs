#!/bin/bash
if test -d $LFS/sources/tcl8.5.12
 then
  rm -rf $LFS/sources/tcl8.5.12
fi
tar -xzf $LFS/sources/tcl8.5.12-src.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/tcl8.5.12 &&

cd unix &&
./configure --prefix=/tools &&
make &&
TZ=UTC make test &&
make install &&
chmod -v u+w /tools/lib/libtcl8.5.so &&
make install-private-headers &&
ln -sv tclsh8.5 /tools/bin/tclsh