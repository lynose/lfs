#!/bin/bash
if test -d /sources/gmp-5.0.5
 then
  rm -rf /sources/gmp-5.0.5
fi
tar -xJf /sources/gmp-5.0.5.tar.xz -C /sources/ &&
cd /sources/gmp-5.0.5 &&
./configure --prefix=/usr --enable-cxx --enable-mpbsd &&
make &&
make check 2>&1 | tee gmp-check-log &&
awk '/tests passed/{total+=$2} ; END{print total}' gmp-check-log &&
make install &&
mkdir -v /usr/share/doc/gmp-5.0.5 &&
cp    -v doc/{isa_abi_headache,configuration} doc/*.html \
         /usr/share/doc/gmp-5.0.5