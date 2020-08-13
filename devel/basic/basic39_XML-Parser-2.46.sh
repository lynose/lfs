#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/XML-Parser-2.46
 then
  rm -rf /sources/XML-Parser-2.46
fi

tar xf /sources/XML-Parser-2.46.tar.gz -C /sources/ &&

cd /sources/XML-Parser-2.46 &&

perl Makefile.PL &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

make test &&
${log} `basename "$0"` " checked" basic &&

make install &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
