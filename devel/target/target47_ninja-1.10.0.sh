#!/bin/bash
${log} `basename "$0"` " started" target &&
if test -d /sources/ninja-1.10.0
 then
  rm -rf /sources/ninja-1.10.0
fi

tar -xzf /sources/ninja-1.10.0.tar.gz -C /sources/ &&

cd /sources/ninja-1.10.0 &&

python3 configure.py --bootstrap &&
${log} `basename "$0"` " configured" target &&

./ninja ninja_test &&
${log} `basename "$0"` " built" target &&

./ninja_test --gtest_filter=-SubprocessTest.SetWithLots &&
${log} `basename "$0"` " checked" target &&

install -vm755 ninja /usr/bin/ &&
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja &&
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja &&
${log} `basename "$0"` " installed" target &&
${log} `basename "$0"` " finished" target 
