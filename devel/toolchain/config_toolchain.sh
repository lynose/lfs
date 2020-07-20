cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
MAKEFLAGS='-j 8'
log=${LFS}/sh/log/logger.sh
export LFS LC_ALL LFS_TGT PATH MAKEFLAGS log
EOF
source ~/.bash_profile
