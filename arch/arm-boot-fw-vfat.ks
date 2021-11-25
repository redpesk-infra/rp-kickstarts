# Partitioning
# NOTE: /boot and swap MUST use --asprimary to ensure '/' is the last partition in order for rootfs-resize to work.
# Need to create logical volume groups first then partition
zerombr
clearpart --all --disklabel=msdos

# Offset partition, will be deleted after anaconda install
part /offsettodelete --fstype vfat --size 10 --label=offsettodelete

part /boot/firmware  --fstype vfat --size 100    --asprimary --label=firmware


%post --erroronfail --log /tmp/post-arm-boot-fw-vfat.log
sed -i '/firmware/d' /etc/fstab
%end