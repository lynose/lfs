#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/meson-0.56.0
 then
  rm -rf /sources/meson-0.56.0
fi

tar xf /sources/meson-0.56.0.tar.gz -C /sources/ &&

patch -Np1 -i ../meson-0.56.0-upstream_fix-1.patch &&

cd /sources/meson-0.56.0 &&

python3 setup.py build &&
${log} `basename "$0"` " built" basic &&

python3 setup.py install --root=dest &&
cp -rv dest/* / &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 

