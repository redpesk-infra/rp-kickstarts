#version=DEVEL
# Keyboard layouts
keyboard --vckeymap=fr --xlayouts='fr'
# Root password
rootpw --plaintext root
# set hostname
network --hostname CES2020-nuc
# System language
lang en_US.UTF-8
# License agreement
eula --agreed
# Reboot after installation
reboot
# System timezone
timezone Europe/Paris --isUtc
# System authorization information
auth --useshadow --passalgo=sha512
# Firewall configuration
firewall --disable
ignoredisk --only-use=vda
repo --name="RedPesk" --baseurl="http://kojihub.lorient.iot/kojifiles/repos-dist/RedPesk-8--RedPesk-8-release/latest/x86_64/" --cost=1 --install
repo --name="RedPesk-Build" --baseurl="http://kojihub.lorient.iot/kojifiles/repos/RedPesk-8--RedPesk-8-build/latest/x86_64/" --cost=1 --install
repo --name="koji-override-1" --baseurl=http://fmirrors.lorient.iot/fmirrors/fedora/linux/releases/28/Everything/x86_64/os
# Use network installation
#url --url="https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/28/Everything/x86_64/os/"
url --url="http://fmirrors.lorient.iot/fmirrors/fedora/linux/releases/28/Everything/x86_64/os"
# Run the Setup Agent on first boot
firstboot --disable
# SELinux configuration
selinux --disabled
# Do not configure the X Window System
skipx
text

# System services
services --enabled="sshd,NetworkManager,chronyd"
# System bootloader configuration
#bootloader --location=mbr --boot-drive=vda
bootloader --location=mbr --boot-drive=vda --append=" security=none"
reqpart --add-boot
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --none --initlabel
# Disk partitioning information
part / --fstype="ext4" --grow --size=7000 --label="root"
part swap --fstype="swap" --size=1000 --label="swap"


%post
# work around for poor key import UI in PackageKit
rm -f /var/lib/rpm/__db*
releasever=$(rpm -q --qf '%{version}\n' redpesk-release)
basearch=x86_64
#wget http://kojihub01.lorient.iot/iotbzh-repositories/m3ulcb-bsp/RPM-GPG-KEY-RedPesk-Bootstrap -O /etc/pki/rpm-gpg/RPM-GPG-KEY-RedPesk-Bootstrap
#rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-RedPesk-Bootstrap
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-redpesk-8-primary
#rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
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

sed -i -r 's:(nomodeset|quiet|rhgb) ?: :g' /etc/default/grub
grub2-mkconfig -o /etc/grub2-efi.cfg

mkdir -p /usr/local/lib/systemd/system/
cat << EOF >> /usr/local/lib/systemd/system/rp-setup.service
[Unit]
Description=Initial Setup reconfiguration mode trigger service
After=plymouth-quit-wait.service
After=afm-system-daemon.service
After=NetworkManager-wait-online.service
Wants=NetworkManager-wait-online.service
After=nss-lookup.target
ConditionPathExists=/.unconfigured

[Service]
Environment=XDG_RUNTIME_DIR=/run/user/0
Type=oneshot
TimeoutSec=0
RemainAfterExit=yes
ExecStartPre=/usr/bin/wget http://kojihub01.lorient.iot/rp-setup-x86 -O /usr/libexec/rp-setup
ExecStart=/usr/bin/bash -c "source /usr/libexec/rp-setup"
ExecStartPost=/usr/bin/rm -f /.unconfigured
TimeoutSec=0
RemainAfterExit=no

[Install]
WantedBy=graphical.target
WantedBy=multi-user.target
EOF

touch /.unconfigured
systemctl enable rp-setup.service
%end

%packages
@core
redpesk-release-iot
redpesk-repos
redpesk-seanasim-x64
iotop
htop
i3
i3status
rofi
opencpn
#for Johann :)
nano
#for Romain :p
vim
alsa-lib
alsa-tools
alsa-utils
alsa-firmware
-pulseaudio
-lvm2
sox
electron
# AGL
agl-app-framework-binder
agl-app-framework-main
# agl binding are installed via script in kojihub01
#agl-appli-homescreen-html
#agl-appli-mixer-html
#agl-appli-hvac-html
#4a-mixer
#4a-redpesk-audio-service
#web-mumble
%end
