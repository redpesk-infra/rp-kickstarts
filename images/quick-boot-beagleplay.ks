%include core-beagleplay.ks
%include ../distro/redpesk-minimal.ks

# Called at the end
#%include ../features/factory_backup.ks

%packages
-can-tests
-can-utils
-dnf-utils
-i2c-tools
-iw
-picocom
-platform-runtime-tools
-rng-tools
-tar
-tree
-usbutils
-vim
%end
