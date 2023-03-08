%include ../nxp/imx.ks

%post --erroronfail --nochroot --log /mnt/sysroot/tmp/post-imx8.log
# Copy the u-boot binary at the NXP i.MX8 board's expected offset
dd if=/mnt/sysroot/boot/flash.bin of=/dev/mapper/Redpesk-OS bs=1024 seek=32 conv=fsync
%end


%packages
uboot
%end
