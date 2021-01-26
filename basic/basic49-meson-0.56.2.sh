#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/meson-0.56.2
 then
  rm -rf /sources/meson-0.56.2
fi

tar xf /sources/meson-0.56.2.tar.gz -C /sources/ &&

cd /sources/meson-0.56.2 &&

python3 setup.py build &&
${log} `basename "$0"` " built" basic &&

python3 setup.py install --root=dest &&
cp -rv dest/* / &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 

