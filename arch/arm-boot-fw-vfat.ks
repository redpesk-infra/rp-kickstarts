%pre --erroronfail --log /tmp/pre-arm-boot-fw-vfat.log

PART_TYPE="msdos"
START_OFFSET=0
BOOT_FS="fat32"
BOOT_SIZE=100

echo "PART_TYPE="${PART_TYPE} >> /tmp/rp-boot.cfg
echo "START_OFFSET="${START_OFFSET} >> /tmp/rp-boot.cfg
echo "BOOT_FS="${BOOT_FS} >> /tmp/rp-boot.cfg
echo "BOOT_SIZE="${BOOT_SIZE} >> /tmp/rp-boot.cfg

%end


part /boot/firmware  --fstype=vfat --onpart=vda1 --label=firmware


%post --erroronfail --log /tmp/post-arm-boot-fw-vfat.log
sed -i '/firmware/d' /etc/fstab
%end