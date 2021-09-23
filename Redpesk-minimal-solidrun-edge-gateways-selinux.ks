%include features/selinux.ks
%include images/minimal-solidrun.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
