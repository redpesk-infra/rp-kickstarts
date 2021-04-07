%include features/selinux.ks
%include images/core-cm3.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
