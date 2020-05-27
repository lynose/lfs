#!/bin/bash
${log} `basename "$0"` " started" toolchain &&

if test -d $LFS/sources/perl-5.30.2
 then
  rm -rf $LFS/sources/perl-5.30.2
fi
tar -xJf $LFS/sources/perl-5.30.2.tar.xz -C $LFS/sources/ &&
cd $LFS/sources/perl-5.30.2 &&


sh Configure -des -Dprefix=/tools -Dlibs=-lm -Uloclibpth -Ulocincpth &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

cp -v perl cpan/podlators/scripts/pod2man /tools/bin &&
mkdir -pv /tools/lib/perl5/5.30.2 &&
cp -Rv lib/* /tools/lib/perl5/5.30.2 &&
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
