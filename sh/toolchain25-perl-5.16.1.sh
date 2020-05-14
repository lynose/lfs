#!/bin/bash
if test -d $LFS/sources/perl-5.16.1
 then
  rm -rf $LFS/sources/perl-5.16.1
fi
tar -xjf $LFS/sources/perl-5.16.1.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/perl-5.16.1 &&

patch -Np1 -i ../perl-5.16.1-libc-2.patch &&
sh Configure -des -Dprefix=/tools &&
make &&
cp -v perl cpan/podlators/pod2man /tools/bin &&
mkdir -pv /tools/lib/perl5/5.16.1 &&
cp -Rv lib/* /tools/lib/perl5/5.16.1