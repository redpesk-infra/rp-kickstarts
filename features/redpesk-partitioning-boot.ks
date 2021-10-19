# Partitioning
# NOTE: /boot and swap MUST use --asprimary to ensure '/' is the last partition in order for rootfs-resize to work.
# Need to create logical volume groups first then partition

%pre --erroronfail --log /tmp/pre-boot.log
DEVICE="/dev/vda"

source /tmp/rp-boot.cfg
[ -z $BOOT_FS ] || [ -z $START_OFFSET ] || [ -z $BOOT_SIZE ] || [ -z $PART_TYPE ] && exit -1

# 1Mib = 1.04858 MB
function conv_mibtomb() {
	float=$(echo | awk -v n=$1 '{print n*1.04858}')
	printf '%.0f\n' $float
}

START_OFFSET=$(conv_mibtomb $START_OFFSET)
BOOT_SIZE=$(conv_mibtomb $BOOT_SIZE)

# clear the MBR and partition table
dd if=/dev/zero of=$DEVICE bs=512 count=1

if ! [[ $PART_TYPE =~ ^(msdos|gpt)$ ]]; then
	echo "Part type not supported. Exiting..."
	exit -1
fi

parted -s $DEVICE mklabel $PART_TYPE
parted -s $DEVICE mkpart primary $BOOT_FS $START_OFFSET $(($START_OFFSET + $BOOT_SIZE))
[[ $PART_TYPE == "gpt" ]] && parted -s $DEVICE name 1 boot
exit 0
%end