%pre --erroronfail --log /tmp/pre-boot-EFI.log

PART_TYPE="gpt"
START_OFFSET=0
BOOT_FS="fat32"
BOOT_SIZE=500

echo "PART_TYPE="${PART_TYPE} >> /tmp/rp-boot.cfg
echo "START_OFFSET="${START_OFFSET} >> /tmp/rp-boot.cfg
echo "BOOT_FS="${BOOT_FS} >> /tmp/rp-boot.cfg
echo "BOOT_SIZE="${BOOT_SIZE} >> /tmp/rp-boot.cfg

%end

part /boot/efi --onpart=vda1 --label=EFI
