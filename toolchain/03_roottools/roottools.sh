${log} `basename "$0"` " ======================================" roottools &&
${log} `basename "$0"`  "Started roottools build" roottools &&
${log} `basename "$0"` " ======================================" roottools &&
export WORKDIR=`pwd` &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools03-gcc-stdc++-11.1.0-pass2.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools04-gettext-0.21.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools05-bison-3.7.6.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools06-perl-5.34.0.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools07-python-3.9.5.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools08-texinfo-6.7.sh &&
${log} `basename "$0"` " ======================================" roottools &&
./roottools09-util-linux-2.37.sh &&
${log} `basename "$0"` " ======================================" roottools &&
${log} `basename "$0"` " Stripping" roottools &&
${log} `basename "$0"` " ======================================" roottools &&
find /usr/{lib,libexec} -name \*.la -delete &&
rm -rf /usr/share/{info,man,doc}/* &&
${log} `basename "$0"` " Finished roottools build" roottools
