%include ../nxp/imx.ks

%post --erroronfail --nochroot --log /tmp/post-solidrun-imx8mn-compact.log
# Copy the u-boot binary at the Solidrun board's expected offset
dd if=/mnt/sysroot/boot/flash.bin of=/dev/mapper/Redpesk-OS bs=1024 seek=32
%end


%packages
configs-solidrun
solidrun-firmware
uboot
%end
