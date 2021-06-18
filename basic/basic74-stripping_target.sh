find /usr/lib -type f -name \*.a \
   -exec strip --strip-debug {} ';'

find /usr/lib -type f -name \*.so* ! -name \*dbg \
   -exec strip --strip-unneeded {} ';'

find /usr/{bin,sbin,libexec} -type f \
    -exec strip --strip-all {} ';'
    
rm -rf /tmp/*


