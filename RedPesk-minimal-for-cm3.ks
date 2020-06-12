%include distro/RedPesk-minimal.ks
%include boards/broadcom/cm3.ks
#%include features/smack.ks
%include packages/mbbox.ks


%post --erroronfail --log /tmp/post-mbbox.log
systemctl enable systemd-timesyncd
%end