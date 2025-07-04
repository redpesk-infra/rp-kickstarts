# Partitioning

# Beagleplay requires a MBR labeled /boot partition that the following code does

zerombr
clearpart --all --disklabel=msdos

part /boot --fstype vfat --size 200 --asprimary --label=boot --mkfsoptions="-F 32"

%post --nochroot --logfile=/mnt/sysroot/tmp/post-beagleplay-part.log --erroronfail

BLK_ID=$(blkid /dev/mapper/Redpesk-OS* | grep -i "LABEL=.boot" | awk -F ':' '{print $1}') # /dev/Redpesk-OS...p1

echo "BLK_ID ${BLK_ID}"
echo "Setting Flags \(boot,lba\)"

parted /dev/mapper/Redpesk-OS set ${BLK_ID: -1} boot on
parted /dev/mapper/Redpesk-OS set ${BLK_ID: -1} lba on
parted /dev/mapper/Redpesk-OS type ${BLK_ID: -1} "0x0c" # to have W95 FAT32 (LBA) format

%end
