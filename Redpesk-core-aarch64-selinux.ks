%include images/core-aarch64.ks
%include features/selinux.ks
%include features/extract_logs.ks
%include features/networkmanager.ks

bootloader --location=mbr --timeout=1 --boot-drive="/dev/mapper/Redpesk-OS" --append="security=selinux console=tty1"