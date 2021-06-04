#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/ncurses-6.2
 then
  rm -rf /sources/ncurses-6.2
fi
tar -xzf /sources/ncurses-6.2.tar.gz -C /sources/ &&
cd /sources/ncurses-6.2 &&

./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --enable-widec &&
${log} `basename "$0"` " configured" basic &&
            
make &&
${log} `basename "$0"` " built" basic &&

make install &&

for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so &&
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so &&
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done

rm -vf                     /usr/lib/libcursesw.so &&
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so &&
ln -sfv libncurses.so      /usr/lib/libcurses.so &&

rm -fv /usr/lib/libncurses++w.a &&

mkdir -v       /usr/share/doc/ncurses-6.2 &&
cp -v -R doc/* /usr/share/doc/ncurses-6.2 &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/ncurses-6.2 &&
${log} `basename "$0"` " finished" basic 

