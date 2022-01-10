%include features/smack.ks
%include images/minimal-renesas-gen3.ks
%include features/extract_logs.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
