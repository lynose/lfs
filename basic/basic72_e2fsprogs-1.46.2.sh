#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/e2fsprogs-1.46.2
 then
  rm -rf /sources/e2fsprogs-1.46.2
fi
tar xf /sources/e2fsprogs-1.46.2.tar.gz -C /sources/ &&
cd /sources/e2fsprogs-1.46.2 &&

mkdir -v build &&
cd build &&

../configure --prefix=/usr           \
             --bindir=/bin           \
             --with-root-prefix=""   \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make check &&
${log} `basename "$0"` " unexpected check succeed" basic
${log} `basename "$0"` " expected check fail?" basic

make install &&
chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a &&
gunzip -v /usr/share/info/libext2fs.info.gz &&
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info &&
makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo &&
install -v -m644 doc/com_err.info /usr/share/info &&
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/e2fsprogs-1.46.2 &&
${log} `basename "$0"` " finished" basic 
