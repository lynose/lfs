#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/iana-etc-20210611
 then
  rm -rf /sources/iana-etc-20210611
fi

tar xf /sources/iana-etc-20210611.tar.gz -C /sources &&

cd /sources/iana-etc-20210611 &&

cp services protocols /etc &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/iana-etc-20210611 &&
${log} `basename "$0"` " finished" basic 
