%include ../arch/boot-EFI.ks
%include ../distro/RedPesk-core.ks
%include ../boards/generic/arm32.ks

services --enabled=sshd,NetworkManager,chronyd
