#!/bin/bash
${log} `basename "$0"` " started" toolchain &&
if test -d $LFS/sources/gettext-0.20.2
 then
  rm -rf $LFS/sources/gettext-0.20.2
fi

tar -xJf $LFS/sources/gettext-0.20.2.tar.xz -C $LFS/sources/ &&

cd $LFS/sources/gettext-0.20.2 &&

./configure --disable-shared &&
${log} `basename "$0"` " configured" toolchain &&

make &&
${log} `basename "$0"` " build" toolchain &&

cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /tools/bin
${log} `basename "$0"` " installed" toolchain &&
${log} `basename "$0"` " finished" toolchain
