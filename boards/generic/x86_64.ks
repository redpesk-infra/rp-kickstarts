%packages --ignoremissing --nocore --exclude-weakdeps
grub2-efi-x64-modules
grub-redpesk
%end

%post --erroronfail --log /tmp/post-generic.log
mkdir -p /boot/efi/EFI/redpesk/x86_64-efi/
cp $(find /usr/lib/grub -name 'smbios.mod') /boot/efi/EFI/redpesk/x86_64-efi/
dnf -y remove grub2-efi-x64-modules
%end
