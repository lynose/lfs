#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/perl-5.32.0
 then
  rm -rf /sources/perl-5.32.0
fi

tar xf /sources/perl-5.32.0.tar.xz -C /sources/ &&

cd /sources/perl-5.32.0 &&

export BUILD_ZLIB=False &&
export BUILD_BZIP2=0 &&
sh Configure -des                                         \
             -Dprefix=/usr                                \
             -Dvendorprefix=/usr                          \
             -Dprivlib=/usr/lib/perl5/5.32/core_perl      \
             -Darchlib=/usr/lib/perl5/5.32/core_perl      \
             -Dsitelib=/usr/lib/perl5/5.32/site_perl      \
             -Dsitearch=/usr/lib/perl5/5.32/site_perl     \
             -Dvendorlib=/usr/share/perl5/vendor_perl     \
             -Dvendorarch=/usr/lib/perl5/5.32/vendor_perl \
             -Dman1dir=/usr/share/man/man1                \
             -Dman3dir=/usr/share/man/man3                \
             -Dpager="/usr/bin/less -isR"                 \
             -Duseshrplib                                 \
             -Dusethreads &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make test &&          # 2 Test fails
${log} `basename "$0"` " unexpected test succeeded" basic
${log} `basename "$0"` " expected test failed" basic

make install &&
unset BUILD_ZLIB BUILD_BZIP2 &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
