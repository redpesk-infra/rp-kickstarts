%include distro/RedPesk-minimal.ks
%include boards/generic/arm.ks
%include features/smack.ks
%include features/redpesk-partitioning.ks
%include features/recovery.ks
%include features/reduce_size.ks

services --enabled=sshd,NetworkManager,chronyd
autopart --type=plain --noswap

