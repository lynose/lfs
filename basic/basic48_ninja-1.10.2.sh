#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/ninja-1.10.2
 then
  rm -rf /sources/ninja-1.10.2
fi

tar -xzf /sources/ninja-1.10.2.tar.gz -C /sources/ &&

cd /sources/ninja-1.10.2 &&

sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc

python3 configure.py --bootstrap &&
${log} `basename "$0"` " configured and built" basic &&

./ninja ninja_test &&
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots &&
${log} `basename "$0"` " check succeed" blfs_all ||
${log} `basename "$0"` " !!!check failed!!!" blfs_all


install -vm755 ninja /usr/bin/ &&
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja &&
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja &&
${log} `basename "$0"` " installed" basic &&
${log} `basename "$0"` " finished" basic 
