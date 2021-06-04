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
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1 &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/readline-8.1 &&
${log} `basename "$0"` " finished" basic
