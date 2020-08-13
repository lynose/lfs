#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/iana-etc-20200429
 then
  rm -rf /sources/iana-etc-20200429
fi

tar xf /sources/iana-etc-20200429.tar.gz -C /sources &&

cd /sources/iana-etc-20200429 &&

cp services protocols /etc &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
