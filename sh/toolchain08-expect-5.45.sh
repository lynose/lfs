#!/bin/bash
if test -d $LFS/sources/expect5.45
 then
  rm -rf $LFS/sources/expect5.45
fi
tar -xjf $LFS/sources/expect5.45.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/expect5.45 &&

cp -v configure{,.orig} &&
sed 's:/usr/local/bin:/bin:' configure.orig > configure &&

./configure --prefix=/tools --with-tcl=/tools/lib \
  --with-tclinclude=/tools/include &&
make &&
make test &&
make SCRIPTS="" install
