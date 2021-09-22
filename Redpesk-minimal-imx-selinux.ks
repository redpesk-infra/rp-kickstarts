%include features/selinux.ks
%include images/minimal-imx.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
