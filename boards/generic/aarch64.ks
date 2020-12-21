bootloader --timeout=1 --append="security=smack"

zerombr
clearpart --all --initlabel --disklabel=msdos

%packages
@core
@standard
@hardware-support

kernel
# remove this in %post
dracut-config-generic
-dracut-config-rescue
# install tools needed to manage and boot arm systems
@arm-tools
chrony
bcm283x-firmware
# Intel wireless firmware assumed never of use for disk images
-iwl*
-ipw*
-usb_modeswitch
-generic-release*

%end
%post

# Find the architecture we are on
arch=$(uname -m)

# Setup Raspberry Pi firmware
if [[ $arch == "aarch64" ]] || [[ $arch == "armv7l" ]]; then
if [[ $arch == "aarch64" ]]; then
cp -P /usr/share/uboot/rpi_3/u-boot.bin /boot/efi/rpi3-u-boot.bin
cp -P /usr/share/uboot/rpi_4/u-boot.bin /boot/efi/rpi4-u-boot.bin
else
cp -P /usr/share/uboot/rpi_2/u-boot.bin /boot/efi/rpi2-u-boot.bin
cp -P /usr/share/uboot/rpi_3_32b/u-boot.bin /boot/efi/rpi3-u-boot.bin
cp -P /usr/share/uboot/rpi_4_32b/u-boot.bin /boot/efi/rpi4-u-boot.bin
fi
fi

#releasever=$(rpm --eval '%{fedora}')
#rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-primary
#echo "Packages within this disk image"
#rpm -qa --qf '%{size}\t%{name}-%{version}-%{release}.%{arch}\n' |sort -rn
# Note that running rpm recreates the rpm db files which aren't needed or wanted
rm -f /var/lib/rpm/__db*

# remove random seed, the newly installed instance should make it's own
rm -f /var/lib/systemd/random-seed

# The enp1s0 interface is a left over from the imagefactory install, clean this up
rm -f /etc/sysconfig/network-scripts/ifcfg-enp1s0

dnf -y remove dracut-config-generic

# Disable network service here, as doing it in the services line
# fails due to RHBZ #1369794
/sbin/chkconfig network off

# Remove machine-id on pre generated images
rm -f /etc/machine-id
touch /etc/machine-id

%end
