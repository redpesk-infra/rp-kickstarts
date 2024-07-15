%include images/minimal-phytec.ks
%include features/smack.ks
%include features/extract_logs.ks

# Disabling bootloader for ARM images
bootloader --location=none --disabled

%packages
#uboot-smack
#This a tmp package with all the firmware binaries
firmware-bin
%end
