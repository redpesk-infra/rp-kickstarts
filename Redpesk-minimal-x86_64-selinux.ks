%include images/minimal-x86_64.ks
%include features/selinux.ks
%include features/extract_logs.ks
%include features/networkmanager.ks

# System bootloader configuration
bootloader --location=mbr --timeout=1 --boot-drive="/dev/mapper/Redpesk-OS" --append="security=selinux console=ttyS0,115200"