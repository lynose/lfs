#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/iana-etc-20210202
 then
  rm -rf /sources/iana-etc-20210202
fi

tar xf /sources/iana-etc-20210202.tar.gz -C /sources &&

cd /sources/iana-etc-20210202 &&

cp services protocols /etc &&
${log} `basename "$0"` " installed" basic &&

rm -rf /sources/iana-etc-20210202 &&
${log} `basename "$0"` " finished" basic 
