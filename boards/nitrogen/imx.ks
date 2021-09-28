%include ../nxp/imx.ks

%post --erroronfail --log /tmp/post-nitrogen-imx.log

%end


%packages
uboot
uboot-bootscripts
qcacld-kmod
%end
