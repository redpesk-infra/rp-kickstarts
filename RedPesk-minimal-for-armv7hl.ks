%include distro/RedPesk-minimal.ks
%include boards/generic/arm32.ks
%include features/smack.ks

services --enabled=sshd,NetworkManager,chronyd
