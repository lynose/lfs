#!/bin/bash
${log} `basename "$0"` " started" target &&
save_usrlib="ld-2.33.so libc-2.33.so libpthread-2.33.so libthread_db-1.0.so
             libquadmath.so.0.0.0 libstdc++.so.6.0.29
             libitm.so.1.0.0 libatomic.so.1.2.0" 

cd /usr/lib

for LIB in $save_usrlib; do
    objcopy --only-keep-debug $LIB $LIB.dbg
    strip --strip-unneeded $LIB
    objcopy --add-gnu-debuglink=$LIB.dbg $LIB
done

unset LIB save_usrlib &&
${log} `basename "$0"` " finished" target 
