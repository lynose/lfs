#!/bin/bash
if test -d /sources/gdbm-1.18.1
 then
  rm -rf /sources/gdbm-1.18.1
fi

tar -xzf /sources/gdbm-1.18.1.tar.gz -C /sources/ &&

cd /sources/gdbm-1.18.1 &&

sed -r -i '/^char.*parseopt_program_(doc|args)/d' src/parseopt.c &&

./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat &&
make &&
make check &&
make install
