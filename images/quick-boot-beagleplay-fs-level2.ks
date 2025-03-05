%include core-beagleplay.ks
%include ../distro/redpesk-minimal.ks

# Called at the end
#%include ../features/factory_backup.ks

%packages

#--------------level 0
#--------------level 1
#Missing in cynagora-setup.service
smack-userspace-utils
-i2c-tools
-audit
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
#--------------level 4
#--------------
%end

bootloader --location=none --disabled
