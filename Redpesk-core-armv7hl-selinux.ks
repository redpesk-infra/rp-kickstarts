%include features/selinux.ks
%include images/core-armv7hl.ks

bootloader --timeout=1 --append="security=selinux console=tty1"