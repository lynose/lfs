#!/bin/bash
if test -d /sources/openssl-1.1.1g
 then
  rm -rf /sources/openssl-1.1.1g
fi

tar -xzf /sources/openssl-1.1.1g.tar.gz -C /sources/ &&

cd /sources/openssl-1.1.1g &&

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic &&

make &&

make test 

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile &&
make MANSUFFIX=ssl install &&

mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.1g &&
cp -vfr doc/* /usr/share/doc/openssl-1.1.1g 
