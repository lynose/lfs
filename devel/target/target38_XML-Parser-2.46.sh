#!/bin/bash
if test -d /sources/XML-Parser-2.46
 then
  rm -rf /sources/XML-Parser-2.46
fi

tar -xzf /sources/XML-Parser-2.46.tar.gz -C /sources/ &&

cd /sources/XML-Parser-2.46 &&

perl Makefile.PL &&
make &&
make test &&
make install 
