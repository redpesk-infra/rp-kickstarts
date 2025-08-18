%include optim-level-1.ks

%packages --exclude-weakdeps
-python3-firewall
-firewalld

-NetworkManager
-NetworkManager-tui
-NetworkManager-team

systemd-networkd

%end