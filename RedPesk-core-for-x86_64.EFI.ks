%include arch/x86-base.ks
%include arch/boot-EFI.ks
%include distro/RedPesk-core.ks
%include features/smack.ks
%include features/recovery.ks
%include features/reduce_size.ks

# Called at the end
#%include features/factory_backup.ks

