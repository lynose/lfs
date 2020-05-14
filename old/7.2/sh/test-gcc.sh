#!/bin/bash
echo 'main(){}' > $LFS/sources/dummy.c
cc $LFS/sources/dummy.c -o $LFS/sources/a.out
readelf -l $LFS/sources/a.out | grep ': /tools'
