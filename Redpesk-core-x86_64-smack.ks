%include features/smack.ks
%include images/core-x86_64.ks

# System bootloader configuration
bootloader --location=mbr --boot-drive=vda --append="security=smack console=ttyS0"