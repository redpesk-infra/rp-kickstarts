%include features/selinux.ks
%include images/minimal-m3ulcb.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
