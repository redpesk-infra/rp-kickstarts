%include ../../arch/arm-base.ks

zerombr
clearpart --all --disklabel=gpt

# Add an offset on the first part (/boot) to let some space for firmware
part /boot  --fstype ext4 --size 500    --asprimary --label=boot --start=10

%post --erroronfail --log /tmp/post-imx.log
# Set your board specific post actions here
%end


%packages
# Custom kernel for IMX
linux-firmware-imx
-atmel-firmware
-libertas-usb8388-firmware
-zd1211-firmware
-uboot-images-armv7
-uboot-images-armv8
-bcm283x-firmware
%end
