%include distro/RedPesk-minimal.ks
%include boards/generic/x86-EFI.ks
%include features/smack.ks
%include features/redpesk-partitioning.ks
%include features/recovery.ks



# Called at the end
#%include features/factory_backup.ks