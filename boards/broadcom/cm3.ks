%include bcm283x.ks


%post --erroronfail --log /tmp/post-cm3.log

%end


%packages
# Custom kernel for CM3
-linux-firmware-brcm
-uboot-images-armv7
-uboot-images-armv8
uboot
%end
