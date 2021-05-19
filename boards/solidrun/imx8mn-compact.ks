%include ../../arch/arm-base.ks
%include ../../arch/arm-boot-ext4.ks

%post --erroronfail --log /tmp/post-solidrun-imx8mn-compact.log

%end


%packages
configs-solidrun
solidrun-firmware
uboot
%end
