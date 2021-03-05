#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/vim-8.2.2433
 then
  rm -rf /sources/vim-8.2.2433
fi

tar xf /sources/vim-8.2.2433.tar.gz -C /sources/ &&

cd /sources/vim-8.2.2433 &&

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

<<<<<<< HEAD:basic/basic67_vim-8.2.2433.sh
chown -Rv tester . &&

su tester -c "LANG=en_US.UTF-8 make -j1 test" &> /log/vim-test.log &&
${log} `basename "$0"` " unexpected test succeed" basic
${log} `basename "$0"` " expected test fail?" basic

=======
# chown -Rv tester . &&
# 
# su tester -c "LANG=en_US.UTF-8 make -j1 test" &> vim-test.log &&
>>>>>>> master:basic/basic67_vim-8.2.1361.sh

make install &&
ln -sv vim /usr/bin/vi &&
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done
<<<<<<< HEAD:basic/basic67_vim-8.2.2433.sh

cd /usr/share/vim &&
ln -sv ../vim/vim82/doc /usr/share/doc/vim-8.2.2433 &&
=======
cd /usr/share/vim && 
ln -sfv ../vim/vim82/doc /usr/share/doc/vim-8.2.1361 &&
>>>>>>> master:basic/basic67_vim-8.2.1361.sh
${log} `basename "$0"` " installed" basic &&

cat > /etc/vimrc << "EOF" &&
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1 

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

rm -rf /sources/vim-8.2.2433 &&
${log} `basename "$0"` " finished" basic 
