%include images/core-rpi.ks
%include features/smack.ks
%include features/extract_logs.ks
%include features/networkmanager.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled

%packages --exclude-weakdeps
uboot-smack
%end
