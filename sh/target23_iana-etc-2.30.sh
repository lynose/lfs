#!/bin/bash
if test -d /sources/iana-etc-2.10
 then
  rm -rf /sources/iana-etc-2.10
fi
tar -xjf /sources/iana-etc-2.10.tar.bz2 -C /sources &&
cd /sources/iana-etc-2.10 &&
make &&
make install