%include ../../arch/arm-base.ks
%include ../../arch/arm-boot-msdos-vfat.ks


%post --erroronfail --log /tmp/post-bcm283x.log
# Set your board specific post actions here
%end


%packages
bcm2835-firmware
bcm2711-firmware
linux-firmware-brcm
%end