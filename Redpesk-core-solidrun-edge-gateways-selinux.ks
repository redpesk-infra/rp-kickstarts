%include images/core-solidrun-solidsence.ks
%include features/selinux.ks
%include features/extract_logs.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
