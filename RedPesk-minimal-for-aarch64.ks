%include distro/RedPesk-minimal.ks
%include boards/generic/aarch64.ks
%include features/smack.ks

services --enabled=sshd,NetworkManager,chronyd
autopart --type=plain --noswap

