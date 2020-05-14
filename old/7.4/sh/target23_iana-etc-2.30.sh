#!/bin/bash
if test -d /sources/iana-etc-2.30
 then
  rm -rf /sources/iana-etc-2.30
fi
tar -xjf /sources/iana-etc-2.30.tar.bz2 -C /sources &&
cd /sources/iana-etc-2.30 &&
make &&
make install