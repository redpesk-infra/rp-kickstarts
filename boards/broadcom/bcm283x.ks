%include ../../arch/arm-base.ks
%include ../../arch/arm-boot-fw-vfat.ks


%post --erroronfail --log /tmp/post-bcm283x.log
# Set your board specific post actions here
%end


%packages
bcm283x-firmware
linux-firmware-brcm
%end