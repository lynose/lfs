#!/bin/bash
RUN_DIR=$PWD &&
export RUN_DIR &&
echo $RUN_DIR &&

PACKAGES=$RUN_DIR/../packages &&
export PACKAGES &&
echo $PACKAGES &&

PATCHES=$RUN_DIR/../patch &&
export PATCHES &&
echo $PATCHES

SOURCES=$LFS/sources &&
export SOURCES &&
echo $SOURCES &&

TCL_VERSION=8.5.9 &&
export TCL_VERSION &&
echo $TCL_VERSION &&

if test -d $SOURCES/tcl$TCL_VERSION
 then
  rm -rf $SOURCES/tcl$TCL_VERSION
fi
tar xjf $PACKAGES/tcl$TCL_VERSION-src.tar.bz2 -C $SOURCES &&

cd $SOURCES/tcl$TCL_VERSION &&

sleep 10 &&
cd unix &&
./configure --prefix=/tools &&
make &&
#TZ=UTC make test
make install
chmod -v u+w /tools/lib/libtcl8.5.so &&
make install-private-headers &&
ln -sv tclsh8.5 /tools/bin/tclsh