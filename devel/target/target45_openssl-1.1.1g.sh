#!/bin/bash
${log} `basename "$0"` " started" target &&
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
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make test -j1 &&
${log} `basename "$0"` " unexpected check succeed" target
${log} `basename "$0"` " expected check failed?" target

sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile &&
make MANSUFFIX=ssl install &&
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.1g &&
cp -vfr doc/* /usr/share/doc/openssl-1.1.1g 
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
