%include level1.ks
%packages

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

%end