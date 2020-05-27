#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/make-4.3
 then
  rm -rf /sources/make-4.3
fi
tar -xzf /sources/make-4.3.tar.gz -C /sources/ &&

cd /sources/make-4.3 &&

./configure --prefix=/usr &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make PERL5LIB=$PWD/tests/ check &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
