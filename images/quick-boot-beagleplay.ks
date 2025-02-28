%include core-beagleplay.ks
%include ../distro/redpesk-minimal.ks

# Called at the end
#%include ../features/factory_backup.ks

%packages
-can-tests
-can-utils
-dnf-utils
-i2c-tools
-picocom
-platform-runtime-tools
-rng-tools
-tar
-tree
-usbutils
-vim

-dracut-live
-dracut-config-generic
-dracut-redpesk-common
-dracut-redpesk-recovery

-iw
-wireless-regdb
-NetworkManager-wifi

-wget
%end

bootloader --location=none --disabled
