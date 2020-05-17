#!/bin/bash
if test -d /sources/make-4.3
 then
  rm -rf /sources/make-4.3
fi
tar -xzf /sources/make-4.3.tar.gz -C /sources/ &&

cd /sources/make-4.3 &&

./configure --prefix=/usr &&

make &&

make PERL5LIB=$PWD/tests/ check &&

make install
