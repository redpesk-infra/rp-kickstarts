%include features/smack.ks
%include images/minimal-x86_64.ks

# System bootloader configuration
bootloader --location=mbr --timeout=1 --boot-drive="/dev/mapper/Redpesk-OS" --append="security=smack console=ttyS0,115200"