%include images/core-solidrun-solidsence.ks
%include features/smack.ks
%include features/extract_logs.ks
%include features/networkmanager.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
