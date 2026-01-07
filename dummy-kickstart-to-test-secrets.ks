# System authorization information
authselect select sssd
# License agreement
eula --agreed
firstboot --disable
ignoredisk --drives=sd*|nvme*|vd*|sr*
# Keyboard layouts
keyboard --vckeymap=fr --xlayouts='fr'
# System language
lang en_US.UTF-8
# Network information
network  --bootproto=dhcp --device=link --activate
# Shutdown after installation
shutdown
# Root password
rootpw --plaintext password
# SELinux configuration
selinux --disabled
# Do not configure the X Window System
skipx
# System timezone
timezone Europe/Paris --utc
# System bootloader configuration
bootloader --append="security=smack console=ttyS0,115200" --location=mbr --timeout=1 --boot-drive=/dev/mapper/Redpesk-OS
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel --disklabel=gpt
# Disk partitioning information
part /boot/efi --asprimary --fstype="FAT32" --size=200 --label=EFI
part / --fstype="ext4" --size=800 --fsoptions="noatime,rw" --label=rootfs


%post --nochroot --logfile=/mnt/sysroot/tmp/post-binding_install.log --erroronfail
# Exit script on first error as this step is mandatory for package installation
set -e

# Use mock dnf config file to be able to access repository
CONFIG_FILE="/etc/dnf/dnf.conf"
CHROOT_DIR="/mnt/sysimage"
RPMS_DIR=${CHROOT_DIR}"/var/lib/rp-firstboot/rpms"

# Since first boot RPMs are not installed in the image, they are not listed in manifest.log
rpm -qp ${RPMS_DIR}/* >> /tmp/manifest-firstboot.log
%end


%post --nochroot
# Save pre and post action logs for extraction into koji
cp /mnt/sysroot/tmp/pre-*.log /chroot_tmpdir/lmc-logs
cp /mnt/sysroot/tmp/post-*.log /chroot_tmpdir/lmc-logs
%end


%packages --nocore --exclude-weakdeps
${{secrets.package}}
%end

