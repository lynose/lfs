#!/bin/bash
if test -d $LFS/sources/gettext-0.18.1.1
 then
  rm -rf $LFS/sources/gettext-0.18.1.1
fi
tar -xjf $LFS/sources/gettext-0.18.1.1.tar.bz2 -C $LFS/sources/ &&
cd $LFS/sources/gettext-0.18.1.1 &&

sed -i -e '/gets is a/d' gettext-*/*/stdio.in.h &&
cd gettext-tools &&
EMACS="no" ./configure --prefix=/tools --disable-shared &&
make -C gnulib-lib &&
make -C src msgfmt &&
cp -v src/msgfmt /tools/bin