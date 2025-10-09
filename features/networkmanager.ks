
%packages --ignoremissing --nocore --exclude-weakdeps
NetworkManager-wifi

%end

%pre-install
# disable systemd-networkd
mkdir -p /mnt/sysimage/etc/systemd/system-preset
cat <<EOF > /mnt/sysimage/etc/systemd/system-preset/10-disable-networkd.preset
disable systemd-networkd.service
disable systemd-networkd-wait-online.service
EOF
%end

%post
## Firewall configuration
firewall --enabled --service=mdns,ssh

# Fix NetworkManager DNS resolving
rm -f /etc/resolv.conf
ln -sf /run/NetworkManager/resolv.conf /etc/resolv.conf

%end