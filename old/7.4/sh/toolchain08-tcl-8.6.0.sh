#!/bin/bash
if test -d $LFS/sources/tcl8.6.0
 then
  rm -rf $LFS/sources/tcl8.6.0
fi
tar -xzf $LFS/sources/tcl8.6.0-src.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/tcl8.6.0 &&
sed -i s/500/5000/ generic/regc_nfa.c &&
cd unix &&
./configure --prefix=/tools &&
make &&
TZ=UTC make test &&
make install &&
chmod -v u+w /tools/lib/libtcl8.6.so &&
make install-private-headers &&
ln -sv tclsh8.6 /tools/bin/tclsh
