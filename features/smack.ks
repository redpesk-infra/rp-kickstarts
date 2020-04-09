# Add security option into Kernel cmdline
bootloader --location=mbr --boot-drive=vda --append="security=smack"


%post --erroronfail --log /tmp/post-feature.log
dracut --force -I /etc/smack/accesses.d/default-access-domains -I /etc/smack/accesses.d/default-access-domains-no-user /boot/initramfs-*.img --no-kernel
%end
