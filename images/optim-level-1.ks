
%packages --exclude-weakdeps
-i2c-tools
-audit
systemd-bootchart
%end

%packages --exclude-weakdeps

-can-tests
-can-utils
-dnf-utils
-picocom
-platform-runtime-tools
-rng-tools
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

-iw
-wireless-regdb

#Needed by systemd, policycoreutils
#-libselinux-utils

-tuned
-lsscsi
%end