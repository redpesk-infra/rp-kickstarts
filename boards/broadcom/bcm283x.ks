%include ../../arch/arm-base.ks


%post --erroronfail --log /tmp/post-bcm28xx.log
# Set your board specific post actions here
%end


%packages
bcm283x-firmware
%end