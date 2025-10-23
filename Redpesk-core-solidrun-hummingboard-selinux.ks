%include images/core-solidrun-hummingboard.ks
%include features/selinux.ks
%include features/extract_logs.ks
%include features/networkmanager.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
