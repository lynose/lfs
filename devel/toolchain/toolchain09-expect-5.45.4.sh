#!/bin/bash
if test -d $LFS/sources/expect5.45.4
 then
  rm -rf $LFS/sources/expect5.45.4
fi

tar -xzf $LFS/sources/expect5.45.4.tar.gz -C $LFS/sources/ &&

cd $LFS/sources/expect5.45.4 &&

cp -v configure{,.orig} &&
sed 's:/usr/local/bin:/bin:' configure.orig > configure &&

./configure                             \
    --prefix=/tools                     \
    --with-tcl=/tools/lib               \
    --with-tclinclude=/tools/include &&
make &&
make test &&
make SCRIPTS="" install
