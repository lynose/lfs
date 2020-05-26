#!/bin/sh

#basic
cat > /etc/systemd/network/10-eth-static.network << "EOF"
[Match]
Name=enp7s0


[Network]
Address=192.168.1.123/24
Gateway=192.168.1.1
DNS=192.168.1.1
Domains=local
EOF

cat > /etc/systemd/network/10-eth-dhcp.network << "EOF"
[Match]
Name=enp7s0

[Network]
DHCP=ipv4

[DHCP]
UseDomains=true
EOF

ln -sfv /run/systemd/resolve/resolv.conf /etc/resolv.conf



echo "newhost" > /etc/hostname

cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1 localhost
127.0.1.1 <FQDN> <HOSTNAME>
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF
