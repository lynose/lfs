#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/meson-0.57.2
 then
  rm -rf /sources/meson-0.57.2
fi

tar xf /sources/meson-0.57.2.tar.gz -C /sources/ &&

cd /sources/meson-0.57.2 &&

python3 setup.py build &&
${log} `basename "$0"` " built" basic &&

python3 setup.py install --root=dest &&
cp -rv dest/* / &&
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson &&
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson &&
${log} `basename "$0"` " installed" basic &&

cd $WORKDIR &&
rm -rf /sources/meson-0.57.2 &&
${log} `basename "$0"` " finished" basic 

