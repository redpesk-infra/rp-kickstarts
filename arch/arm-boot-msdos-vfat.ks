# Partitioning
# NOTE: /boot and swap MUST use --asprimary to ensure '/' is the last partition in order for rootfs-resize to work.
# Need to create logical volume groups first then partition
zerombr
clearpart --all --disklabel=msdos

#The partition must have the same name as the label
part /firmware  --fstype vfat --size 128    --asprimary --label=firmware

%post --nochroot --logfile=/mnt/sysroot/tmp/post-arm-boot.log --erroronfail

BLK_ID=$(blkid -L firmware)
BLK_ID_SD=$(echo "${BLK_ID}" | sed -e 's/\([0-9]\+\)//g')
BLK_ID_SD_ID=$(echo "${BLK_ID}" | tr -dc '0-9')

echo "BLK_ID ${BLK_ID}"
echo "BLK_ID_SD ${BLK_ID_SD}"
echo "BLK_ID_SD_ID ${BLK_ID_SD_ID}"

echo "Setting Flags into "\"${BLK_ID}\"\(\[${BLK_ID_SD}\]\[${BLK_ID_SD_ID}\]\)"... \(boot,lba\)"
if [ -n "${BLK_ID_SD}" ] && [ -n "${BLK_ID_SD_ID}" ]; then
    parted "${BLK_ID_SD}" set "${BLK_ID_SD_ID}" boot on
    parted "${BLK_ID_SD}" set "${BLK_ID_SD_ID}" lba on
else
    echo "Can't Add Flags to ${BLK_ID}..."
    exit 1
fi
%end
