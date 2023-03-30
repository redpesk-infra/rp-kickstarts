%include imx.ks

%post --erroronfail --nochroot --log /mnt/sysroot/tmp/post-imx8.log
# Copy the u-boot binary at the NXP i.MX8 board's expected offset
dd if=/mnt/sysroot/boot/flash.bin of=/dev/mapper/Redpesk-OS bs=1024 seek=32 conv=fsync

echo "Creating symlink for iMX8's VPU firmware"
set -x
mkdir -p /mnt/sysroot/usr/lib/firmware/vpu
pushd /mnt/sysroot/usr/lib/firmware/vpu
ln -s ../amphion/vpu/* .
popd
set +x
%end


%packages
uboot
linux-firmware-amphion
%end
