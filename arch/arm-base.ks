%post --erroronfail --log /tmp/post-arch.log
# Because memory is scarce resource in most arm systems we are differing from the Fedora
# default of having /tmp on tmpfs.
echo "Disabling tmpfs for /tmp."
systemctl mask tmp.mount
%end


%packages
-grubby
-grubby-deprecated
-extlinux-bootloader
-fedora-arm-installer
-grub2-common
-grub2-tools
-grub2-tools-minimal
-plymouth
-shim*
%end
