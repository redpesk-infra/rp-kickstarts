%include images/core-imx8.ks
%include features/smack.ks
%include features/extract_logs.ks
%include features/networkmanager.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
