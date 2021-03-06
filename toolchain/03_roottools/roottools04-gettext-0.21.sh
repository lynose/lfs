#!/bin/bash
${log} `basename "$0"` " started" roottools &&
if test -d /sources/gettext-0.21
 then
  rm -rf /sources/gettext-0.21
fi

tar -xJf /sources/gettext-0.21.tar.xz -C /sources/ &&

cd /sources/gettext-0.21 &&

./configure --disable-shared &&
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin
${log} `basename "$0"` " installed" roottools &&

rm -rf /sources/gettext-0.21
${log} `basename "$0"` " finished" roottools
