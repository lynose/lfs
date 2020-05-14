#!/bin/bash
if test -d /sources/gmp-5.1.2
 then
  rm -rf /sources/gmp-5.1.2
fi

tar -xJf /sources/gmp-5.1.2.tar.xz -C /sources/ &&

cd /sources/gmp-5.1.2 &&

./configure --prefix=/usr --enable-cxx &&

make &&

make check 2>&1 | tee gmp-check-log &&

awk '/tests passed/{total+=$2} ; END{print total}' gmp-check-log &&

make install &&

mkdir -v /usr/share/doc/gmp-5.1.2 &&
cp    -v doc/{isa_abi_headache,configuration} doc/*.html \
         /usr/share/doc/gmp-5.1.2