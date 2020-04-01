# Use the text interface not the graphical one
text
#version=DEVEL
eula --agreed
# Use automatic partioning on vda
ignoredisk --only-use=vda
# System language
lang en_US.UTF-8
# Keyboard layouts
keyboard --vckeymap=fr --xlayouts='fr'
# Use network installation
#url --mirrorlist "https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-28&arch=aarch64"
# Additionnal repositories
repo --name="RedPesk" --baseurl="http://kojihub.lorient.iot/kojifiles/repos-dist/RedPesk-8--RedPesk-8-release/latest/x86_64/" --cost=1 --install
repo --name="RedPesk-Build" --baseurl="http://kojihub.lorient.iot/kojifiles/repos/RedPesk-8--RedPesk-8-build/latest/x86_64/" --cost=1 --install
# System authorization information
auth --useshadow --passalgo=sha512
# Firewall configuration
firewall --enabled --service=mdns,ssh
# Run the Setup Agent on first boot
firstboot --reconfig
# SELinux configuration
selinux --disabled
# Timezone setup
timezone --isUtc Europe/Paris
# Root password setup
rootpw --plaintext root
# Do not configure the X Window System
skipx
# Reboot the image once installed. ImageFactory look for that!
reboot
# Do the install
install

# System services
services --enabled="sshd,NetworkManager,chronyd,initial-setup"
# System bootloader configuration
zerombr
bootloader --location=mbr --boot-drive=vda
# Partition clearing information
clearpart --none --initlabel
autopart --nolvm

%post
# work around for poor key import UI in PackageKit
rm -f /var/lib/rpm/__db*
releasever=$(rpm -q --qf '%{version}\n' redpesk-release)
basearch=x86_64
wget http://kojihub01.lorient.iot/iotbzh-repositories/m3ulcb-bsp/RPM-GPG-KEY-RedPesk-Bootstrap -O /etc/pki/rpm-gpg/RPM-GPG-KEY-RedPesk-Bootstrap
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-RedPesk-Bootstrap
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-RedPesk-8-primary
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
echo "Packages within this disk image"
rpm -qa
# Note that running rpm recreates the rpm db files which aren't needed or wanted
rm -f /var/lib/rpm/__db*

# remove random seed, the newly installed instance should make it's own
rm -f /var/lib/systemd/random-seed

# Remove machine-id on pre generated images
rm -f /etc/machine-id
touch /etc/machine-id
%end

%post
# setup systemd to boot to the right runlevel
echo -n "Setting default runlevel to multiuser text mode"
rm -f /etc/systemd/system/default.target
ln -s /lib/systemd/system/multi-user.target /etc/systemd/system/default.target

# Add by default the ttyS0 as console device at boot time
sed -i '/^GRUB_CMDLINE_LINUX/s:"$: console=ttyS0":' /etc/default/grub
%end

%packages
@core
@hardware-support
NetworkManager-wifi
chkconfig
wget
chrony
dracut-config-generic
glibc-langpack-en
initial-setup
iw
rng-tools
redpesk-repos
redpesk-release-iot
-@standard
-dracut-config-rescue
-generic-release*
-initial-setup-gui
-iproute-tc
-ipw*
-iwl*
-trousers
-usb_modeswitch
-xkeyboard-config
-lvm2

%end
