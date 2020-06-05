#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/perl-5.30.3
 then
  rm -rf /sources/perl-5.30.3
fi

tar -xJf /sources/perl-5.30.3.tar.xz -C /sources/ &&

cd /sources/perl-5.30.3 &&

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
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make test &&          # 2 Test fails
${log} `basename "$0"` " unexpected test succeeded" target
${log} `basename "$0"` " expected test failed" target

make install &&
unset BUILD_ZLIB BUILD_BZIP2 &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
