#!/bin/bash
if test -d /sources/meson-0.54.1
 then
  rm -rf /sources/meson-0.54.1
fi

tar -xzf /sources/meson-0.54.1.tar.gz -C /sources/ &&

cd /sources/meson-0.54.1 &&

python3 setup.py build &&

python3 setup.py install --root=dest &&
cp -rv dest/* /
