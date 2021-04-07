%include features/selinux.ks
%include images/core-nitrogen.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
