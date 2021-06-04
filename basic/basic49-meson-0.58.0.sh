#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/meson-0.58.0
 then
  rm -rf /sources/meson-0.58.0
fi

tar xf /sources/meson-0.58.0.tar.gz -C /sources/ &&

cd /sources/meson-0.58.0 &&

python3 setup.py build &&
${log} `basename "$0"` " built" basic &&

python3 setup.py install --root=dest &&
cp -rv dest/* / &&
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson &&
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/meson-0.58.0 &&
${log} `basename "$0"` " finished" basic 

