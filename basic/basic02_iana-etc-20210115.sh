#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/iana-etc-20210115
 then
  rm -rf /sources/iana-etc-20210115
fi

tar xf /sources/iana-etc-20210115.tar.gz -C /sources &&

cd /sources/iana-etc-20210115 &&

cp services protocols /etc &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
