#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/iana-etc-20200429
 then
  rm -rf /sources/iana-etc-20200429
fi

tar -xzf /sources/iana-etc-20200429.tar.gz -C /sources &&

cd /sources/iana-etc-20200429 &&

cp services protocols /etc &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
