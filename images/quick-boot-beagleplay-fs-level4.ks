%include core-beagleplay.ks
%include ../distro/redpesk-minimal.ks
%include features/smack.ks

# Called at the end
#%include ../features/factory_backup.ks

%packages
#--------------level 0

#--------------level 1
#Missing in cynagora-setup.service
smack-userspace-utils
-i2c-tools
-audit
kernel-uname-r
systemd-bootchart
#--------------level 2

-can-tests
-can-utils
-dnf-utils
-picocom
-platform-runtime-tools
-rng-tools
-tar
-tree
-usbutils
-vim

-dracut
-dracut-network
-dracut-squash
-dracut-live
-dracut-config-generic
-dracut-redpesk-common
-dracut-redpesk-recovery
-kexec-tools

-psmisc

-iw
-wireless-regdb
-NetworkManager-wifi

#Needed by systemd, policycoreutils
#-libselinux-utils

-wget

-tuned
-iproute

#--------------level 3
-libafbcli6
-afb-client
-libafb6
-afb-binder
-afb-app-manager
-afb-app-manager-rpm
#--------------level 4
-NetworkManager
-kernel-tools
#--------------
%end

bootloader --location=none --disabled
