#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/readline-8.1
 then
  rm -rf /sources/readline-8.1
fi

tar xf /sources/readline-8.1.tar.gz -C /sources/ &&

cd /sources/readline-8.1 &&

sed -i '/MV.*old/d' Makefile.in &&
sed -i '/{OLDSUFF}/c:' support/shlib-install &&

./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.1 &&
${log} `basename "$0"` " configured" basic &&

make SHLIB_LIBS="-lncursesw" &&
${log} `basename "$0"` " built" basic &&

make SHLIB_LIBS="-lncursesw" install &&
mv -v /usr/lib/lib{readline,history}.so.* /lib &&
chmod -v u+w /lib/lib{readline,history}.so.* &&
ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so &&
ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so &&
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1 &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic
