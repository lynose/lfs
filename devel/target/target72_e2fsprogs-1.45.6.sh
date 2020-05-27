#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/e2fsprogs-1.45.6
 then
  rm -rf /sources/e2fsprogs-1.45.6
fi
tar -xzf /sources/e2fsprogs-1.45.6.tar.gz -C /sources/ &&
cd /sources/e2fsprogs-1.45.6 &&

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
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make check -j1 &&
${log} `basename "$0"` " unexpected check succeed" target
${log} `basename "$0"` " expected check fail?" target

make install &&
chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a &&
gunzip -v /usr/share/info/libext2fs.info.gz &&
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info &&
makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo &&
install -v -m644 doc/com_err.info /usr/share/info &&
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
