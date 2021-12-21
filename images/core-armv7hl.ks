%include ../arch/boot-EFI.ks
%include ../boards/generic/arm32.ks
%include ../distro/redpesk-core.ks
%include ../features/recovery.ks
%include ../features/reduce_size.ks

services --enabled=sshd,NetworkManager,chronyd

# Called at the end
#%include ../features/factory_backup.ks
