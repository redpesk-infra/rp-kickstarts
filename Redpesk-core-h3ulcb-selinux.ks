%include features/selinux.ks
%include images/core-h3ulcb.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled