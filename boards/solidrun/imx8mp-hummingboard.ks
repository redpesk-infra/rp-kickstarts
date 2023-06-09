%include ../nxp/imx8.ks

%post --erroronfail --nochroot --log /mnt/sysroot/tmp/post-solidrun-imx8mp-hummingboard.log
# Copy the u-boot binary at the Solidrun board's expected offset
dd if=/mnt/sysroot/boot/flash.bin of=/dev/mapper/Redpesk-OS bs=1024 seek=32
%end


%packages
uboot
solidrun-firmware
%end
