%pre --erroronfail --log /tmp/pre-boot-BIOS.log

PART_TYPE="msdos"
START_OFFSET=0
BOOT_FS="fat32"
BOOT_SIZE=500

echo "PART_TYPE="${PART_TYPE} >> /tmp/rp-boot.cfg
echo "START_OFFSET="${START_OFFSET} >> /tmp/rp-boot.cfg
echo "BOOT_FS="${BOOT_FS} >> /tmp/rp-boot.cfg
echo "BOOT_SIZE="${BOOT_SIZE} >> /tmp/rp-boot.cfg

%end

part /boot --onpart=vda1 --label=boot
