%include arm.ks

%packages --ignoremissing --nocore --exclude-weakdeps
uboot-images-armv7
-shim-ia32
-grub2-efi-ia32
%end
