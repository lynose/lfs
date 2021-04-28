${log} `basename "$0"` " ======================================" crosstools &&
${log} `basename "$0"`  "Started Cross Toolchain build in $LFS"  crosstools &&
${log} `basename "$0"` " ======================================" crosstools &&
export WORKDIR=$(pwd) &&
${log} `basename "$0"` " ======================================" crosstools &&
./crosstools01-binutils-2.36.1.sh &&
${log} `basename "$0"` " ======================================" crosstools &&
./crosstools02-gcc-10.2.0-pass1.sh &&
${log} `basename "$0"` " ======================================" crosstools &&
./crosstools03-linux-header-5.11.16.sh &&
${log} `basename "$0"` " ======================================" crosstools &&
./crosstools04-glibc-2.33.sh &&
${log} `basename "$0"` " ======================================" crosstools &&
./crosstools05-gcc-stdc++-10.2.0-pass1.sh &&
${log} `basename "$0"` " ======================================" crosstools &&
${log} `basename "$0"` " Finished Toolchain build in $LFS" crosstools &&
${log} `basename "$0"` " ======================================" crosstools
