#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/openssl-1.1.1g
 then
  rm -rf /sources/openssl-1.1.1g
fi

tar xf /sources/openssl-1.1.1g.tar.gz -C /sources/ &&

cd /sources/openssl-1.1.1g &&

./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make test &&
${log} `basename "$0"` " unexpected check succeed" basic
${log} `basename "$0"` " expected check failed?" basic

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile &&
make MANSUFFIX=ssl install &&
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.1g &&
cp -vfr doc/* /usr/share/doc/openssl-1.1.1g 
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
