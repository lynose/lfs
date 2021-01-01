#!/bin/bash
${log} `basename "$0"` " started" basic &&
if test -d /sources/vim-8.2.1361
 then
  rm -rf /sources/vim-8.2.1361
fi

tar xf /sources/vim-8.2.1361.tar.gz -C /sources/ &&

cd /sources/vim-8.2.1361 &&

echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h &&
./configure --prefix=/usr &&
${log} `basename "$0"` " configured" basic &&

make &&
${log} `basename "$0"` " built" basic &&

chown -Rv tester . &&

su tester -c "LANG=en_US.UTF-8 make -j1 test" &> vim-test.log &&

make install &&
ln -sv vim /usr/bin/vi &&
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done
ln -sv ../vim/vim82/doc /usr/share/doc/vim-8.2.1361 &&
${log} `basename "$0"` " installed" basic &&

cat > /etc/vimrc << "EOF"
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
${log} `basename "$0"` " finished" basic 
