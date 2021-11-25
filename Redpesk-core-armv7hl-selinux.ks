%include features/selinux.ks
%include images/core-armv7hl.ks

bootloader --location=mbr --timeout=1 --boot-drive="/dev/mapper/Redpesk-OS" --append="security=selinux console=tty1"