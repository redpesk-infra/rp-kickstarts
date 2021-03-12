# Partitioning
# NOTE: /boot and swap MUST use --asprimary to ensure '/' is the last partition in order for rootfs-resize to work.
# Need to create logical volume groups first then partition
zerombr
clearpart --all

part /boot/firmware  --fstype vfat --size 100    --asprimary --label=boot


%post --erroronfail --log /tmp/post-arm-boot-vfat.log
sed -i '/firmware/d' /etc/fstab
%end