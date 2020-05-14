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
echo $SOURCES

PERL_VERSION=5.12.3 &&
export PERL_VERSION &&
echo $PERL_VERSION &&

echo $LFS_TGT &&

if test -d $SOURCES/perl-$PERL_VERSION
 then
  rm -rf $SOURCES/perl-$PERL_VERSIONN
fi
tar xjf $PACKAGES/perl-$PERL_VERSION.tar.bz2 -C $SOURCES &&

cd $SOURCES/perl-$PERL_VERSION &&
patch -Np1 -i $PATCHES/perl-$PERL_VERSION-libc-1.patch &&
sh Configure -des -Dprefix=/tools \
                  -Dstatic_ext='Data/Dumper Fcntl IO' &&
make perl utilities ext/Errno/pm_to_blib &&
cp -fv perl pod/pod2man /tools/bin &&
mkdir -pv /tools/lib/perl5/$PERL_VERSION &&
cp -Rfv lib/* /tools/lib/perl5/$PERL_VERSION