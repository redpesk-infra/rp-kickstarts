%include images/core-xilinx-zynqmp.ks
%include features/selinux.ks
%include features/extract_logs.ks
%include features/networkmanager.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
