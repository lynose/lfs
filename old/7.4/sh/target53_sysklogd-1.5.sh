#!/bin/bash
if test -d /sources/sysklogd-1.5
 then
  rm -rf /sources/sysklogd-1.5
fi
tar -xzf /sources/sysklogd-1.5.tar.gz -C /sources/ &&
cd /sources/sysklogd-1.5 &&

make &&

make BINDIR=/sbin install &&

cat > /etc/syslog.conf << "EOF"
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF