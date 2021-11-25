%include features/smack.ks
%include images/minimal-aarch64.ks

bootloader --location=mbr --timeout=1 --boot-drive="/dev/mapper/Redpesk-OS" --append="security=smack console=tty1"