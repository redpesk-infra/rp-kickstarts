#Create and correct dracut initramfs file to be loaded into uboot
#This initramfs will be used for recovery mode and will then but installed into
#recovery partition mounted in /recovery

%packages
dracut-redpesk-recovery
%end


%post --erroronfail --log /tmp/post-initramfs.log
dracut -f --no-kernel --confdir="/etc/dracut.conf.d/redpesk/" /tmp/initramfs.img

if [[ `rpm -E %{_arch}` == "aarch64" ]]; then
	mkimage -A arm64 -O linux -T ramdisk -C gzip -d /tmp/initramfs.img /recovery/initramfs.img
	rm -f /tmp/initramfs.img
else
	mv /tmp/initramfs.img /recovery/initramfs.img
	#Re-generate grub2 entries with recovery initramfs
	grub2-mkconfig -o /boot/efi/EFI/redpesk/grub.cfg
fi

#Remove pkg only installed for initramfs generating
dnf remove -y dracut-redpesk-recovery

%end
