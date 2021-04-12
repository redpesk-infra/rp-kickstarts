%include ../../arch/arm-base.ks
%include ../../arch/arm-boot-ext4.ks

%post --erroronfail --log /tmp/post-nitrogen-imx.log

%end


%packages
uboot
uboot-bootscripts
qcacld-kmod
%end
