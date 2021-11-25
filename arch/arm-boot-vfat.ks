# Partitioning
# NOTE: /boot and swap MUST use --asprimary to ensure '/' is the last partition in order for rootfs-resize to work.
# Need to create logical volume groups first then partition
zerombr
clearpart --all --disklabel=gpt

# Offset partition, will be deleted after anaconda install
part /offsettodelete --fstype vfat --size 10 --label=offsettodelete

part /boot  --fstype vfat --size 500    --asprimary --label=boot
