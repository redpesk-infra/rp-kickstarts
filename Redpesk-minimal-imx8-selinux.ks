%include features/selinux.ks
%include images/minimal-imx8.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
