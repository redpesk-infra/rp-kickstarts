%include features/selinux.ks
%include images/minimal-nitrogen.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
