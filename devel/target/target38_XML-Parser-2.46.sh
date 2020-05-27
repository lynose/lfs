#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/XML-Parser-2.46
 then
  rm -rf /sources/XML-Parser-2.46
fi

tar -xzf /sources/XML-Parser-2.46.tar.gz -C /sources/ &&

cd /sources/XML-Parser-2.46 &&

perl Makefile.PL &&
${log} `basename "$0"` " configured" target &&

make &&
${log} `basename "$0"` " built" target &&

make test &&
${log} `basename "$0"` " checked" target &&

make install &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
