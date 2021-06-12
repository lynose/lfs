#!/bin/bash
${log} `basename "$0"` " started" roottools &&
if test -d /sources/perl-5.34.0
 then
  rm -rf /sources/perl-5.34.0
fi
tar -xJf /sources/perl-5.34.0.tar.xz -C /sources/ &&
cd /sources/perl-5.34.0 &&


sh Configure -des                                     \
             -Dprefix=/usr                            \
             -Dvendorprefix=/usr                      \
             -Dprivlib=/usr/share/perl5/core_perl     \
             -Darchlib=/usr/lib/perl5/5.32/core_perl  \
             -Dsitelib=/usr/share/perl5/site_perl     \
             -Dsitearch=/usr/lib/perl5/5.32/site_perl \
             -Dvendorlib=/usr/share/perl5/vendor_perl \
             -Dvendorarch=/usr/lib/perl5/5.32/vendor_perl &&
${log} `basename "$0"` " configured" roottools &&

make &&
${log} `basename "$0"` " build" roottools &&

make install &&
${log} `basename "$0"` " installed" roottools &&

cd $WORKDIR &&
rm -rf /sources/perl-5.34.0 &&
${log} `basename "$0"` " finished" roottools