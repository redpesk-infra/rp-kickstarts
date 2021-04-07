%include features/selinux.ks
%include images/core-aarch64.ks

bootloader --timeout=1 --append="security=selinux console=tty1"