%include features/selinux.ks
%include images/minimal-cm3.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
