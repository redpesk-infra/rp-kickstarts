%include ../nxp/imx.ks

%post --erroronfail --log /tmp/post-nitrogen-imx.log
dd if=/boot/flash.bin of=/dev/mapper/Redpesk-OS bs=1024 seek=32 conv=fsync

%end


%packages --exclude-weakdeps
uboot
uboot-bootscripts
qcacld-kmod
%end
