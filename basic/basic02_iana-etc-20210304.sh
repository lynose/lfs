#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/iana-etc-20210304
 then
  rm -rf /sources/iana-etc-20210304
fi

tar xf /sources/iana-etc-20210304.tar.gz -C /sources &&

cd /sources/iana-etc-20210304 &&

cp services protocols /etc &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/iana-etc-20210304 &&
${log} `basename "$0"` " finished" basic 
