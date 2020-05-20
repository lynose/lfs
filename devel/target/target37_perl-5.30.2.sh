#!/bin/bash
if test -d /sources/perl-5.30.2
 then
  rm -rf /sources/perl-5.30.2
fi

tar -xJf /sources/perl-5.30.2.tar.xz -C /sources/ &&

cd /sources/perl-5.30.2 &&

echo "127.0.0.1 localhost $(hostname)" > /etc/hosts &&

export BUILD_ZLIB=False &&
export BUILD_BZIP2=0 &&

sh Configure -des -Dprefix=/usr                 \
                  -Dvendorprefix=/usr           \
                  -Dman1dir=/usr/share/man/man1 \
                  -Dman3dir=/usr/share/man/man3 \
                  -Dpager="/usr/bin/less -isR"  \
                  -Duseshrplib                  \
                  -Dusethreads &&
make &&
make test           # 2 Test fails
make install &&
unset BUILD_ZLIB BUILD_BZIP2
