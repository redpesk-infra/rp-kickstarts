%include ../distro/RedPesk-minimal.ks
%include core-cm3.ks


%post --erroronfail --log /tmp/post-mbbox.log
systemctl enable systemd-timesyncd
%end
