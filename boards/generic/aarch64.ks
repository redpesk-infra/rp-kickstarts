%include arm.ks

%packages --ignoremissing --nocore --exclude-weakdeps
uboot-images-armv8
-grubby-deprecated
grub2-efi-aa64-modules
grub-redpesk
%end


%post --erroronfail --log /tmp/post-generic.log
mkdir -p /boot/efi/EFI/redpesk/aarch64-efi
cp $(find /usr/lib/grub -name 'smbios.mod') /boot/efi/EFI/redpesk/aarch64-efi/
dnf -y remove grub2-efi-aa64-modules
%end
