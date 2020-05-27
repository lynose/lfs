#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

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
${log} `basename "$0"` " configured" toolchain &&
   
make &&
${log} `basename "$0"` " build" toolchain &&

make test &&
${log} `basename "$0"` " tested" toolchain &&

make SCRIPTS="" install &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
