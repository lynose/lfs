#!/bin/bash
if test -d /sources/perl-5.16.1
 then
  rm -rf /sources/perl-5.16.1
fi
tar -xjf /sources/perl-5.16.1.tar.bz2 -C /sources/ &&
cd /sources/perl-5.16.1 &&
echo "127.0.0.1 localhost $(hostname)" > /etc/hosts &&
sed -i -e "s|BUILD_ZLIB\s*= True|BUILD_ZLIB = False|"           \
       -e "s|INCLUDE\s*= ./zlib-src|INCLUDE    = /usr/include|" \
       -e "s|LIB\s*= ./zlib-src|LIB        = /usr/lib|"         \
    cpan/Compress-Raw-Zlib/config.in &&
sh Configure -des -Dprefix=/usr                 \
                  -Dvendorprefix=/usr           \
                  -Dman1dir=/usr/share/man/man1 \
                  -Dman3dir=/usr/share/man/man3 \
                  -Dpager="/usr/bin/less -isR"  \
                  -Duseshrplib &&
make &&
make -k test &&
make install