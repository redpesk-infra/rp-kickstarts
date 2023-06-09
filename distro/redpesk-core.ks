%include ../features/redpesk-partitioning.ks
%include ../features/password.ks
%include ../features/regional.ks

#Live media need
network --bootproto=dhcp --device=link --activate
# Use the text interface not the graphical one
#text
#version=DEVEL
# Firewall configuration
firewall --enabled --service=mdns,ssh
# Be sure host drive will not be touched by anaconda
ignoredisk --drives="vd*"
# Run the Setup Agent on first boot
firstboot --disable
# Do not configure the X Window System
skipx
# Shutdown the image when finished
shutdown
# System services
services --enabled="sshd,NetworkManager,chronyd,cpupower"
services --disabled="kdump"

%addon com_redhat_kdump --disable
%end

%post --erroronfail --log /tmp/post-distro.log
echo "Packages within this disk image :"
rpm -qa | sort -h
echo ""
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
#Permit root login in ssh
[ -f /etc/ssh/sshd_config ] && sed -ri "s/^\#?(PermitRootLogin).*$/\1 yes/" /etc/ssh/sshd_config
echo .

echo "ARCH=\"`rpm --eval %{_arch}`\"" >> /etc/os-release
echo "BUILD_DATE=\"`date '+%Y-%m-%d %H:%M:%S'`\"" >> /etc/os-release
%end

%packages
@core
NetworkManager-wifi
chkconfig
chrony
dracut-config-generic   # remove this in %post
dracut-live
glibc-langpack-en
redpesk-repos
iotbzh-rpm-config
platform-firstboot
wget
dnf
dracut-redpesk-common
#hack: needed by dnf
libgomp
sssd-client
-@standard
-glibc-all-langpacks
-fedora-repos
-fedora-repos-modular
-dracut-config-rescue
-generic-release*
-initial-setup
-initial-setup-gui
-iproute-tc
-ipw*
-iwl*
-lvm2
-trousers
-usb_modeswitch
-xkeyboard-config

%end

%include ../packages/tools.ks
