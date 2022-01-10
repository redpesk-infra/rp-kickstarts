%include features/selinux.ks
%include images/core-h3ulcb.ks
%include features/extract_logs.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
