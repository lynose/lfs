#!/bin/bash
if test -d $LFS/sources/gettext-0.18.3
 then
  rm -rf $LFS/sources/gettext-0.18.3
fi
tar -xzf $LFS/sources/gettext-0.18.3.tar.gz -C $LFS/sources/ &&
cd $LFS/sources/gettext-0.18.3 &&

sed -i -e '/gets is a/d' gettext-*/*/stdio.in.h &&
cd gettext-tools &&
EMACS="no" ./configure --prefix=/tools --disable-shared &&
make -C gnulib-lib &&
make -C src msgfmt &&
cp -v src/msgfmt /tools/bin