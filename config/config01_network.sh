#!/bin/sh

#basic
cat > /etc/systemd/network/10-eth-dhcp.network << "EOF"
[Match]
Name=enp7s0

[Network]
DHCP=ipv4

[DHCP]
UseDomains=true
EOF

cat > /etc/systemd/network/10-wlan-dhcp.network << "EOF"
[Match]
Name=wlp1s0

[Network]
DHCP=yes

[DHCP]
UseDomains=true
EOF

ln -sfv /run/systemd/resolve/resolv.conf /etc/resolv.conf



echo "Velorum" > /etc/hostname

cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1 localhost
127.0.1.1 velorum.theimert.net velorum
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF
