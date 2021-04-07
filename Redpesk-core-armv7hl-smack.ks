%include features/smack.ks
%include images/core-armv7hl.ks

bootloader --timeout=1 --append="security=smack console=tty1"