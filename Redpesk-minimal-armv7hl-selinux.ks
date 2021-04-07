%include features/selinux.ks
%include images/minimal-armv7hl.ks

bootloader --timeout=1 --append="security=selinux console=tty1"