%packages --ignoremissing --nocore --exclude-weakdeps
systemd-networkd
systemd-resolved

-firewalld
-python3-firewall
%end


%post
cat > /etc/systemd/network/10-eth0.network <<EOF
[Match]
Name=eth0

[Link]
RequiredForOnline=routable

[Network]
DHCP=yes
EOF

cat > /etc/systemd/network/10-eth1.network <<EOF
[Match]
Name=eth1

[Link]
RequiredForOnline=routable

[Network]
DHCP=yes
EOF

%end