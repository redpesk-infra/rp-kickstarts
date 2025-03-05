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

-psmisc

-iw
-wireless-regdb
-NetworkManager-wifi

-libselinux-utils

-wget

#--------------level 3
-libafbcli6
-afb-client
-libafb6
-afb-binder
-afb-app-manager
-afb-app-manager-rpm
#--------------level 4
#--------------

%end

bootloader --location=none --disabled
