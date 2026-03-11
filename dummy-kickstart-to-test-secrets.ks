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

%packages --nocore --exclude-weakdeps
rpm
${{secrets.package}}
%end

