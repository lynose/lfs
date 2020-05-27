#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/meson-0.54.2
 then
  rm -rf /sources/meson-0.54.2
fi

tar -xzf /sources/meson-0.54.2.tar.gz -C /sources/ &&

cd /sources/meson-0.54.2 &&

python3 setup.py build &&
${log} `basename "$0"` " built" target &&

python3 setup.py install --root=dest &&
cp -rv dest/* / &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 

