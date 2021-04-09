%include ../arch/boot-EFI.ks
%include ../distro/redpesk-core.ks
%include ../boards/generic/arm32.ks

services --enabled=sshd,NetworkManager,chronyd
