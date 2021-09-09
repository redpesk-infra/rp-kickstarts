%include features/selinux.ks
%include images/core-renesas-gen3.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
