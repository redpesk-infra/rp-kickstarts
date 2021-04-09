%include ../arch/boot-EFI.ks
%include ../distro/redpesk-core.ks
%include ../boards/generic/arm.ks
%include ../features/recovery.ks
%include ../features/reduce_size.ks

services --enabled=sshd,NetworkManager,chronyd

