#!/bin/bash
${log} `basename "$0"` " started" basic &&

if test -d /sources/libcap-2.50
 then
  rm -rf /sources/libcap-2.50
fi

tar xf /sources/libcap-2.50.tar.xz -C /sources &&

cd /sources/libcap-2.50 &&


sed -i 's/ $(PROGS)/& capsh/' progs/Makefile &&
sed -i '/install -m.*STA/d' libcap/Makefile &&
${log} `basename "$0"` " configured" basic &&

make prefix=/usr lib=lib &&
${log} `basename "$0"` " built" basic &&

make test &&
${log} `basename "$0"` " tested" basic &&
    
make prefix=/usr lib=lib install &&
chmod -v 755 /usr/lib/lib{cap,psx}.so.2.50 &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/libcap-2.50 &&
${log} `basename "$0"` " finished" basic 
