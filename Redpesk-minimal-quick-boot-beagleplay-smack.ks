%include ./images/core-beagleplay.ks
%include ./distro/redpesk-minimal.ks
%include ./features/smack.ks

# Called at the end
#%include ./features/factory_backup.ks

%include ./images/optim-level-2.ks

bootloader --location=none --disabled

firewall --disable
