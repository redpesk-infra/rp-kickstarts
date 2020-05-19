# Use the text interface not the graphical one
text
#version=DEVEL
# Keyboard layouts
keyboard --vckeymap=fr --xlayouts='fr'
# Root password setup
rootpw --plaintext root
# System language
lang en_US.UTF-8
eula --agreed
# Timezone setup
timezone --isUtc Europe/Paris
# System authorization information
auth --useshadow --passalgo=sha512
# Firewall configuration
firewall --enabled --service=mdns,ssh
# Use automatic partioning on vda
ignoredisk --only-use=vda
# Run the Setup Agent on first boot
firstboot --disable
# SELinux configuration
selinux --disabled
# Do not configure the X Window System
skipx
# Reboot the image once installed. ImageFactory look for that!
reboot
# Do the install
install

# System services
services --enabled="sshd,NetworkManager,chronyd"

%post --erroronfail --log /tmp/post-distro.log
echo "Packages within this disk image"
rpm -qa
# Note that running rpm recreates the rpm db files which aren't needed or wanted
rm -f /var/lib/rpm/__db*

# remove random seed, the newly installed instance should make it's own
rm -f /var/lib/systemd/random-seed

dnf -y remove dracut-config-generic

# Remove machine-id on pre generated images
rm -f /etc/machine-id
touch /etc/machine-id

# setup systemd to boot to the right runlevel
echo -n "Setting default runlevel to multiuser text mode"
rm -f /etc/systemd/system/default.target
ln -s /lib/systemd/system/multi-user.target /etc/systemd/system/default.target
echo .
%end

%packages
@core
@hardware-support
NetworkManager-wifi
chkconfig
chrony
dracut-config-generic   # remove this in %post
glibc-langpack-en
initial-setup
redpesk-release-iot
redpesk-repos
wget
-@standard
-dracut-config-rescue
-generic-release*
-initial-setup
-initial-setup-gui
-iproute-tc
-ipw*
-iwl*
-lvm2
-selinux-policy
-selinux-policy-targeted
-trousers
-uboot-images-armv8
-usb_modeswitch
-xkeyboard-config

%end

%include ../packages/tools.ks
