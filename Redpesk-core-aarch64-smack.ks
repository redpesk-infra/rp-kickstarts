%include features/smack.ks
%include images/core-aarch64.ks
%include features/extract_logs.ks

bootloader --location=mbr --timeout=1 --boot-drive="/dev/mapper/Redpesk-OS" --append="security=smack console=tty1"