%include features/selinux.ks
%include images/minimal-aarch64.ks

bootloader --timeout=1 --append="security=selinux console=tty1"