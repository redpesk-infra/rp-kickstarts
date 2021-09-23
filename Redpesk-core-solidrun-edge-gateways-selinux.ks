%include features/selinux.ks
%include images/core-solidrun.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
