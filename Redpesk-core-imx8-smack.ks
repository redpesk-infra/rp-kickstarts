%include images/core-imx8.ks
%include features/smack.ks
%include features/extract_logs.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled
