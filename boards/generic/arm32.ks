%include arm.ks
%include ../../arch/arm-boot-vfat-efi.ks

%packages
uboot-images-armv7
-uboot-rpi
-shim-ia32
-grub2-efi-ia32
%end
