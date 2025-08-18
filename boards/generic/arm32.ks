%include arm.ks

%packages --exclude-weakdeps
uboot-images-armv7
-shim-ia32
-grub2-efi-ia32
%end
