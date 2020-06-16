# Partitioning
# NOTE: /boot and swap MUST use --asprimary to ensure '/' is the last partition in order for rootfs-resize to work.
# Need to create logical volume groups first then partition
zerombr
clearpart --all

part /boot  --fstype vfat --size 512    --asprimary --label=BOOT
part /      --fstype ext4 --size 2048   --asprimary --label=rootfs  --grow   --fsoptions="noatime"