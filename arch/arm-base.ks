

# Disabling bootloader for ARM images
bootloader --location=none --disabled

# Partitioning
# NOTE: /boot and swap MUST use --asprimary to ensure '/' is the last partition in order for rootfs-resize to work.
# Need to create logical volume groups first then partition
zerombr
clearpart --all

part /boot  --fstype vfat --size 512    --asprimary --label=BOOT
part /      --fstype ext4 --size 2048   --asprimary --label=rootfs  --grow   --fsoptions="noatime"


%post --erroronfail --log /tmp/post-arch.log
# Because memory is scarce resource in most arm systems we are differing from the Fedora
# default of having /tmp on tmpfs.
echo "Disabling tmpfs for /tmp."
systemctl mask tmp.mount
%end


%packages
-extlinux-bootloader
-fedora-arm-installer
-grub2-common
-grub2-tools
-grub2-tools-minimal
-plymouth
-shim*
%end
