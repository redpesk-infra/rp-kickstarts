# Partitioning
# NOTE: /boot and swap MUST use --asprimary to ensure '/' is the last partition in order for rootfs-resize to work.
# Need to create logical volume groups first then partition
zerombr
clearpart --all --disklabel=msdos

part /boot  --fstype ext4 --size 500    --asprimary --label=boot
