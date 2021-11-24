%include features/smack.ks
%include images/core-x86_64.ks

# System bootloader configuration
bootloader --location=mbr --append="security=smack console=ttyS0,115200"
