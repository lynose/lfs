#!/bin/bash
if test -d /sources/flex-2.5.37
 then
  rm -rf /sources/flex-2.5.37
fi
tar -xjf /sources/flex-2.5.37.tar.bz2 -C /sources/ &&
cd /sources/flex-2.5.37 &&

sed -i -e '/test-bison/d' tests/Makefile.in &&

./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info &&

make &&

make check &&

make install &&

ln -sv libfl.a /usr/lib/libl.a &&

cat > /usr/bin/lex << "EOF"
#!/bin/sh
# Begin /usr/bin/lex

exec /usr/bin/flex -l "$@"

# End /usr/bin/lex
EOF
chmod -v 755 /usr/bin/lex

