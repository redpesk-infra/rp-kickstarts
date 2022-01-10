%include features/smack.ks
%include images/minimal-nitrogen.ks
%include features/extract_logs.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
