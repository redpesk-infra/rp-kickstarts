%include images/minimal-x86_64.ks
%include features/smack.ks
%include features/extract_logs.ks

# System bootloader configuration
bootloader --location=mbr --timeout=1 --boot-drive="/dev/mapper/Redpesk-OS" --append="security=smack console=ttyS0,115200"