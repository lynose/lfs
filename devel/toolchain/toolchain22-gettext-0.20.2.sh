#!/bin/bash
if test -d $LFS/sources/gettext-0.20.2
 then
  rm -rf $LFS/sources/gettext-0.20.2
fi

tar -xJf $LFS/sources/gettext-0.20.2.tar.xz -C $LFS/sources/ &&

cd $LFS/sources/gettext-0.20.2 &&

./configure --disable-shared &&
make &&
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /tools/bin
