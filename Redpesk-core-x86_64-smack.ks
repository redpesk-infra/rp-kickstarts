%include features/smack.ks
%include images/core-x86_64.ks

# System bootloader configuration
bootloader --location=mbr --boot-drive="/dev/mapper/Redpesk-OS" --append="security=smack console=ttyS0,115200"
