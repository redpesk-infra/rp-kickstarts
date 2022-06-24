%include bcm283x.ks


%post --erroronfail --log /tmp/post-rpi.log

%end


%packages
-uboot-images-armv7
-uboot-images-armv8
uboot
%end