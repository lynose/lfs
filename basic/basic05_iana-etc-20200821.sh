#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/iana-etc-20200821
 then
  rm -rf /sources/iana-etc-20200821
fi

tar xf /sources/iana-etc-20200821.tar.gz -C /sources &&

cd /sources/iana-etc-20200821 &&

cp services protocols /etc &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
