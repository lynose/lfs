#!/bin/bash
if test -d /sources/iana-etc-20200429
 then
  rm -rf /sources/iana-etc-20200429
fi

tar -xzf /sources/iana-etc-20200429.tar.gz -C /sources &&

cd /sources/iana-etc-20200429 &&

cp services protocols /etc
