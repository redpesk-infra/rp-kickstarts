
%packages --ignoremissing --nocore --exclude-weakdeps
NetworkManager-wifi

%end

%post
## Firewall configuration
firewall --enabled --service=mdns,ssh

# Fix NetworkManager DNS resolving
rm -f /etc/resolv.conf
ln -sf /run/NetworkManager/resolv.conf /etc/resolv.conf

%end