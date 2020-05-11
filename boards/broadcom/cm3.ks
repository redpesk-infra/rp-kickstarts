%include bcm283x.ks

%post --erroronfail --log /tmp/post-cm3.log

%end


%packages
# Custom kernel for CM3
-atmel-firmware
-libertas-usb8388-firmware
-linux-firmware-whence
-zd1211-firmware
-uboot-images-armv7
-uboot-images-armv8
uboot
%end
