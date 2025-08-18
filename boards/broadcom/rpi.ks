%include bcm283x.ks


%post --erroronfail --log /tmp/post-rpi.log

%end


%packages --exclude-weakdeps
-uboot-images-armv7
-uboot-images-armv8
uboot
%end