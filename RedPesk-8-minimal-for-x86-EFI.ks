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
bootloader --location=mbr --boot-drive=vda --append="security=smack"
# Partition clearing information
clearpart --none --initlabel
reqpart --add-boot
part pv.01 --grow
volgroup redpesk-vg0 pv.01
logvol / --label root --name root --fstype ext4 --vgname redpesk-vg0 --size 7000 --grow
logvol swap --label swap --name swap --fstype swap --vgname redpesk-vg0 --size 1000

%post --erroronfail --log /tmp/post.log
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

# setup systemd to boot to the right runlevel
echo -n "Setting default runlevel to multiuser text mode"
rm -f /etc/systemd/system/default.target
ln -s /lib/systemd/system/multi-user.target /etc/systemd/system/default.target

# Install is made using nomodeset flag but we don't need it to use the system.
# It works alright.
sed -i -r 's: ?nomodeset ?::' /etc/default/grub
dracut --force --regenerate-all
dracut --force -I /etc/smack/accesses.d/default-access-domains -I /etc/smack/accesses.d/default-access-domains-no-user $(find /boot -iname "*initramfs*")
%end

%onerror --erroronfail --log /tmp/erroronfail.log
exit 0
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
# AGL
agl-app-framework-binder
agl-app-framework-main
%end

