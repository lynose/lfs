#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/tcl8.6.10
 then
  rm -rf /sources/tcl8.6.10
fi

tar xf /sources/tcl8.6.10-src.tar.gz -C /sources/ &&

cd /sources/tcl8.6.10 &&

tar -xf ../tcl8.6.10-html.tar.gz --strip-components=1 &&

SRCDIR=$(pwd) &&
cd unix &&
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            $([ "$(uname -m)" = x86_64 ] && echo --enable-64bit) &&
${log} `basename "$0"` " configured" basic &&

make &&

sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh &&

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.1|/usr/lib/tdbc1.1.1|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.1/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/tdbc1.1.1/library|/usr/lib/tcl8.6|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.1|/usr/include|"            \
    -i pkgs/tdbc1.1.1/tdbcConfig.sh &&

sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.0|/usr/lib/itcl4.2.0|" \
    -e "s|$SRCDIR/pkgs/itcl4.2.0/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.2.0|/usr/include|"            \
    -i pkgs/itcl4.2.0/itclConfig.sh &&

unset SRCDIR &&
${log} `basename "$0"` " build" basic &&

make test &&
${log} `basename "$0"` " tested" basic &&

make install &&
chmod -v u+w /usr/lib/libtcl8.6.so &&
make install-private-headers &&
ln -sfv tclsh8.6 /usr/bin/tclsh &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic

