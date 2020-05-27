#!/bin/bash
${log} `basename "$0"` " started" target &&
mv -v /tools/bin/{ld,ld-old} &&
mv -v /tools/$(uname -m)-pc-linux-gnu/bin/{ld,ld-old} &&
mv -v /tools/bin/{ld-new,ld} &&
ln -sv /tools/bin/ld /tools/$(uname -m)-pc-linux-gnu/bin/ld &&

gcc -dumpspecs | sed -e 's@/tools@@g'                   \
    -e '/\*startfile_prefix_spec:/{n;s@.*@/usr/lib/ @}' \
    -e '/\*cpp:/{n;s@$@ -idirafter /usr/include@}' >      \
    `dirname $(gcc --print-libgcc-file-name)`/specs &&
    
cd /root &&

echo 'main(){}' > dummy.c &&
cc dummy.c -v -Wl,--verbose &> dummy.log &&
readelf -l a.out | grep ': /lib' &&
sleep 10 &&

grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log &&
sleep 10 &&

grep -B4 '^ /usr/include' dummy.log &&
sleep 10 &&

grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g' &&
sleep 10 &&

grep "/lib.*/libc.so.6 " dummy.log &&
sleep 10 &&

grep found dummy.log &&
sleep 10 &&

rm -v dummy.c a.out dummy.log &&
cd /sh &&
${log} `basename "$0"` " finished" target 
