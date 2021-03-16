%include ../../arch/arm-base.ks
%include ../../arch/arm-boot-vfat.ks

%post --erroronfail --log /tmp/post-nitrogen-imx.log

%end


%packages
uboot-bootscripts
%end
