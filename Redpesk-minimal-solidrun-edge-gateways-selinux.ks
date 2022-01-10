%include features/selinux.ks
%include images/minimal-solidrun.ks
%include features/extract_logs.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
