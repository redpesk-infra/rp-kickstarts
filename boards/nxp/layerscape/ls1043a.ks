%include ../../../arch/arm-base.ks

zerombr
# Layerscape MUST use MSDOS partition table due to firmware location of Region2
# See details into table 24 from 'LSDKUG_Rev21.08.pdf'
clearpart --all --disklabel=msdos

# Add an offset on the first part (/boot) to let some space for firmware (Region2)
part /boot  --fstype ext4 --size 200    --asprimary --label=boot --start=64

%post --erroronfail --log /tmp/post-ls1043a.log
# Set your board specific post actions here
# Copy firmwares at the Layerscape board's expected offsets
dd if=/boot/atf/bl2_sd.pbl of=/dev/mapper/Redpesk-OS bs=512 seek=8 conv=fsync
dd if=/boot/atf/fip.bin of=/dev/mapper/Redpesk-OS bs=512 seek=2048 conv=fsync
%end


%packages
# Custom kernel for LS1043A
atf
configs-layerscape
-linux-firmware-imx
-atmel-firmware
-libertas-usb8388-firmware
-zd1211-firmware
-uboot-images-armv7
-uboot-images-armv8
-bcm283x-firmware
%end
