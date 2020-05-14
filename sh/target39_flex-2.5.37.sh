#!/bin/bash
if test -d /sources/flex-2.5.37
 then
  rm -rf /sources/flex-2.5.37
fi
tar -xjf /sources/flex-2.5.37.tar.bz2 -C /sources/ &&
cd /sources/flex-2.5.37 &&
patch -Np1 -i ../flex-2.5.37-bison-2.6.1-1.patch &&
./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info &&
make &&
make -k check &&
make install &&
ln -sv libfl.a /usr/lib/libl.a &&

cat > /usr/bin/lex << "EOF"
#!/bin/sh
# Begin /usr/bin/lex

exec /usr/bin/flex -l "$@"

# End /usr/bin/lex
EOF
chmod -v 755 /usr/bin/lex &&
mkdir -v /usr/share/doc/flex-2.5.37 &&
cp    -v doc/flex.pdf /usr/share/doc/flex-2.5.37