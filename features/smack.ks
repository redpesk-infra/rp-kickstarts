# To avoid calling bootloader command many time,
# kernel security=smack option have been move to x86-base.ks.

%post --erroronfail --log /tmp/post-feature.log
dracut --force -I /etc/smack/accesses.d/default-access-domains -I /etc/smack/accesses.d/default-access-domains-no-user /boot/initramfs-*.img --no-kernel
%end
